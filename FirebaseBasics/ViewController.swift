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
    
    var bandas = [Bandas]()
    
    var minhaTableView: UITableView  =  UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        registerNotifications()
    }
    
    func registerNotifications()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadBands(notification:)), name: NSNotification.Name(rawValue:
            BANDINFO), object: nil)
    }
    
    func reloadBands(notification: Notification)
    {
        if let userinfo = notification.userInfo
        {
            if let bandas = userinfo["bands"] as? [Bandas]{
                self.bandas = bandas
                self.minhaTableView.reloadData()
            }
            //Recebendo info de bandas
        }
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
        
        FirebaseAccess.sharedInstance.getBand()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.bandas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath)
        
        cell.textLabel?.text = self.bandas[indexPath.item].nome
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        print("User selected table row \(indexPath.row) and item \(itensParaExibir[indexPath.row])")
    }
    
}
