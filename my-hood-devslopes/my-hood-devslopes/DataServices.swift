//
//  DataServices.swift
//  my-hood-devslopes
//
//  Created by Nas@Mac on 1/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation
import UIKit

class DataServices {
    
    static let instance = DataServices()
    
    let KEY_POSTS = "posts"
    
    private var _loadedPosts = [Post]()
    
    var loadedPosts : [Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize() //save to disk
    }
    
    func loadPosts() {
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                
                _loadedPosts = postsArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("postsLoaded", object: nil)
    }
    
    func saveImageAndCreatePath(image: UIImage) -> String {
        // return data to png
        let imgData = UIImagePNGRepresentation(image)
        // set date&time in image's name
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        
        return imgPath
    }
    
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost(post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    
    func documentsPathForFileName(name: String) -> String {
        // Path for personal directory not NSDefaults's directory
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        print(fullPath.stringByAppendingPathComponent(name))
        return fullPath.stringByAppendingPathComponent(name)
    }
    
    
}