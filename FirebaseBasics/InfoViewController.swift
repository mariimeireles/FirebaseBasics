//
//  InfoViewController.swift
//  FirebaseBasics
//
//  Created by Mariana Meireles on 17/07/17.
//  Copyright © 2017 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController{
    
    var nome: String?
    var tipo: String?
    var pais: String?
    var integrantes: String?
    var shows: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nome.
        let tamanhoTela: CGRect = UIScreen.main.bounds
        let larguraTela = tamanhoTela.width
        let alturaTela = tamanhoTela.height
        
        minhaTableView.frame = CGRect(x: 0, y: 50, width: larguraTela, height: alturaTela)

        
        minhaTableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        self.view.addSubview(minhaTableView)
        
    }
}
