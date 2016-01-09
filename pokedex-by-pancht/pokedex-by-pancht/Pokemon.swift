//
//  Pokemon.swift
//  pokedex-by-pancht
//
//  Created by Nas@Mac on 3/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLvl: String!
    private var _pokemonUrl: String!
    
    
    var name: String {
        get {
            if _name == nil {
                _name = ""
            }
            return _name
        }
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        get {
            if _description == nil {
                _description = ""
            }
            return _description
        }
    }
    
    var type: String {
        get {
            if _type == nil {
                _type = ""
            }
            return _type
        }
    }
    
    var defense: String {
        get {
            if _defense == nil {
                _defense = ""
            }
            return _defense
        }
    }
    
    var height: String {
        get {
            if _height == nil {
                _height = ""
            }
            return _height
        }
    }
    
    var weight: String {
        get {
            if _weight == nil {
                _weight = ""
            }
            return _weight
        }
    }
    
    var attack: String {
        get {
            if _attack == nil {
                _attack = ""
            }
            return _attack
        }
    }
    
    var nextEvolutionTxt: String {
        get {
            if _nextEvolutionTxt == nil {
                _nextEvolutionTxt = ""
            }
            return _nextEvolutionTxt
        }
    }
    
    var nextEvolutionId: String {
        get {
            if _nextEvolutionId == nil {
                _nextEvolutionId = ""
            }
            return _nextEvolutionId
        }
    }
    
    var nextEvolutionLvl: String {
        get {
            if _nextEvolutionLvl == nil {
                _nextEvolutionLvl = ""
            }
            return _nextEvolutionLvl
        }
    }
    
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON { response in

            //let result = response.result
                
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                   self._weight = weight
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    
                    //grasp first element's value with key 'name' in array
                    //'types[0]["name"]' - shorted for 'if let name = types["name"]'

                    if let name = types[0]["name"] {
                        self._type = name.capitalizedString
                    }
                    
                    //if more than 1 type, added to string var with "/" seperated sign
                    if types.count > 1 {
                        for var x = 1; x < types.count; x++ {
                            if let name = types[x]["name"]{
                                self._type! += "/\(name)".capitalizedString
                            }
                        }
                    }
                    
                } else {
                    self._type = ""
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0 {
                    
                    //grasp first element's value with key 'resource_uri' in array
                    if let url = descArr[0]["resource_uri"] {
                        let descUrl = NSURL(string: "\(URL_BASE)\(url)")!
                        
                        Alamofire.request(.GET, descUrl).responseJSON { response in
                            
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                    print(self._description)
                                }
                            }
                            
                            completed()
                        } // end sub Alamofire
                    }
                    
                } else {
                    self._description = ""
                } // ended descDict
                
                if let evoArr = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evoArr.count > 0 {
                    
                    if let to = evoArr[0]["to"] as? String {
                        // Can't support mega pokemon right now but 
                        // api still has mega data
                        if to.rangeOfString("mega") == nil {
                            // substring from url to grasp evolution's id number
                            if let uri = evoArr[0]["resource_uri"] as? String {
                                let newStr = uri.stringByReplacingOccurrencesOfString("api/v1/pokemon", withString: "")
                                let numStr = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                self._nextEvolutionId = numStr
                                self._nextEvolutionTxt = to
                                
                                if let lvl = evoArr[0]["level"] as? Int {
                                    self._nextEvolutionLvl = "\(lvl)"
                                    
                                    print(self._nextEvolutionId)
                                    print(self._nextEvolutionTxt)
                                    print(self._nextEvolutionLvl)
                                }
                            }
                        }
                    }
                }
                
                // some resources data must change its website http:// resources and its root teleport from one instant, so when it could have some possible data to change and reform in the middle
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                print(self._type)
                
                

            } // ended dict
        
            
        } // end Alamofire request
    }
  
}
