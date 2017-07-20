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
                    
                    let banda = Bandas()
                    
                    banda.integrantes = value["integrantes"] as? [String]
                    
                    banda.nome = value["nome"] as? String
                    
                    banda.pais = value["pais"] as? String
                    
                    banda.tipo = value["tipo"] as? String
                    
                    banda.shows = value["shows"] as? [String]
        
                    bands.append(banda)
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: BANDINFO), object: nil, userInfo: ["bands": bands])
            }
        })
    }
    
    func updateBand()
    {
        let key = "-KpT4BcvudZT5dewl1pu"
        
        let updateValue = ["tipo": "Rock Nacional/Indie Rock"]
        
        self.database.child("Bandas").child(key).updateChildValues(updateValue)
    }
    
    func createBand()
    {
        let key = self.database.child("Bandas").childByAutoId().key
        
        let bandValue: [String: Any] = ["nome": "Skank", "integrantes": ["Samuel Rosa","Henrique Portugal","Lelo Zaneti","Haroldo Ferreti"], "pais": "Brasil", "tipo": "", "shows": ["10/02", "28/02"]]
        
        self.database.child("Bandas").child(key).setValue(bandValue)
    }
}
