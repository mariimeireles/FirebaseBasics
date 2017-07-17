//
//  FirebaseAccess.swift
//  FirebaseBasics
//
//  Created by Gabriel de Araujo Carvalho on 17/07/17.
//  Copyright © 2017 Mariana Meireles. All rights reserved.
//

import Foundation

import Foundation

import Firebase
import FirebaseDatabase

// MARK :- User Events

let BANDINFO = "band_info"

let data = FirebaseAccess()

class FirebaseAccess : NSObject
{
    
    private var database : DatabaseReference!
    
    class var sharedInstance : FirebaseAccess {
        return data
    }
    
    override init()
    {
        super.init()
        
        self.firebaseDatabase()
    }
    
    public func firebaseConfigure()
    {
        FirebaseApp.configure()
    }
    
    private func firebaseDatabase()
    {
        self.database = Database.database().reference()
    }
    
    func getBand(){
        self.database.child("Bandas").observe(.value, with: { (snapshot: DataSnapshot) in
            if let values = snapshot.value as? [String: Any]
            {
                var bands = [Bandas]()
                
                for postValue in values{
                    let value = postValue.value as! [String: Any]
                    
                    var banda = Bandas()
                    
                    let integrantes = value["integrantes"] as! [String]
                    
                    var arrayIntegrantes = [String]()
                    
                    for integrante in integrantes{
                        
                        arrayIntegrantes.append(integrante)
                    }
                    
                    banda.integrantes = arrayIntegrantes
                    
                    banda.nome = value["nome"] as! String
                    
                    banda.pais = value["pais"] as! String
                    
                    banda.tipo = value["tipo"] as! String
                    
                    let shows = value["shows"] as! [String]
                    
                    var arrayShows = [String]()
                    
                    for show in shows{
                        
                        arrayShows.append(show)
                    }
                    
                    banda.shows = arrayShows
                    
                    bands.append(banda)
                }
                print("array de bandas", bands)
                print("Vou mandar notification")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: BANDINFO), object: nil, userInfo: ["bands": bands])
            }
        })
    }
}
