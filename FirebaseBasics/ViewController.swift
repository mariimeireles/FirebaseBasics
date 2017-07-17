//
//  ViewController.swift
//  FirebaseBasics
//
//  Created by Mariana Meireles on 16/07/17.
//  Copyright © 2017 Mariana Meireles. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var bandas: Bandas?
    
    var minhaTableView: UITableView  =  UITableView()
    
    var bandaDict: [String: Any] = [:]
    
    var banda1 = ["nome"        : "Black Sabbath",
                  "tipo"        : "Heavy metal",
                  "pais"        : "Reino Unido",
                  "integrantes" : "Tony Iommi, Geezer Butler, Ozzy Osbourne"]
    
    var banda2 = ["nome"        : "The Rolling Stones",
                  "tipo"        : "Rock",
                  "pais"        : "Reino Unido",
                  "integrantes" : "Mick Jagger, Keith Richards, Ron Wood, Charlie Watts"]
    
    var banda3 = ["nome"        : "Molejo",
                  "tipo"        : "Pagode",
                  "pais"        : "Brasil",
                  "integrantes" : "Anderson Leonardo, Robson Calazans, Lúcio Nascimento, Jimmy Batera, Claumirzinho, Andrezinho"]
    
//    var itensParaExibir : [banda1, banda2, banda3]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bandaDict.updateValue(banda1, forKey: "banda1")
        bandaDict.updateValue(banda2, forKey: "banda2")
        bandaDict.updateValue(banda3, forKey: "banda3")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tamanhoTela: CGRect = UIScreen.main.bounds
        let larguraTela = tamanhoTela.width
        let alturaTela = tamanhoTela.height
        
        minhaTableView.frame = CGRect(x: 0, y: 50, width: larguraTela, height: alturaTela)
        minhaTableView.dataSource = self
        minhaTableView.delegate = self
        
        minhaTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        self.view.addSubview(minhaTableView)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return bandaDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
        
        cell.textLabel?.text = "oi"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        print("User selected table row \(indexPath.row) and item \(itensParaExibir[indexPath.row])")
    }
    
}
