//
//  InfoViewController.swift
//  FirebaseBasics
//
//  Created by Mariana Meireles on 17/07/17.
//  Copyright © 2017 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var back = UIButton()
    var nome = UILabel()
    var tipo = UILabel()
    var tipos = UILabel()
    var pais = UILabel()
    var paises = UILabel()
    var integrante = UILabel()
    var integrantes =  UITableView()
    var show = UILabel()
    var shows =  UITableView()

    var banda = Bandas()
    
    init(banda: Bandas){
        super.init(nibName: nil, bundle: nil)
        self.banda = banda
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        back.frame = CGRect(x: 0, y: 0, width: 69, height: 64)
        let image = UIImage(named: "back") as UIImage?
        back.setBackgroundImage(image, for: .normal)
        back.addTarget(target, action: #selector(InfoViewController.back(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(back)
        
        let tamanhoTela: CGRect = UIScreen.main.bounds
        let larguraTela = tamanhoTela.width
        
        nome.text = banda.nome
        nome.frame = CGRect(x: 20, y: 60, width: larguraTela, height: 30)
        //nome.frame = UIScreen.mudaEscala(vetor: CGRect(x: 20, y: 60, width: larguraTela, height: 30))
        self.view.addSubview(nome)
        
        tipo.text = "Tipo:"
        tipo.frame = CGRect(x: 20, y: 100, width: larguraTela, height: 30)
        self.view.addSubview(tipo)
        
        tipos.text = banda.tipo
        tipos.frame = CGRect(x: 40, y: 120, width: larguraTela, height: 30)
        self.view.addSubview(tipos)
        
        pais.text = "País:"
        pais.frame = CGRect(x: 20, y: 160, width: larguraTela, height: 30)
        self.view.addSubview(pais)
        
        paises.text = banda.pais
        paises.frame = CGRect(x: 40, y: 180, width: larguraTela, height: 30)
        self.view.addSubview(paises)
        
        integrante.text = "Integrantes:"
        integrante.frame = CGRect(x: 20, y: 220, width: larguraTela, height: 30)
        self.view.addSubview(integrante)
        
        //integrantes.frame = UIScreen.mudaEscala(vetor: CGRect(x: 40, y: 240, width: Int(larguraTela), height: (banda.integrantes?.count)!*40))
        integrantes.frame = CGRect(x: 40, y: 240, width: Int(larguraTela), height: (banda.integrantes?.count)!*40)
        print ("ALTURA DA TABLEVIEW")
        print (integrantes.frame)
        integrantes.dataSource = self
        integrantes.delegate = self
        integrantes.register(UITableViewCell.self, forCellReuseIdentifier: "integrantesCell")
        integrantes.layer.zPosition = -1
        self.view.addSubview(integrantes)
        
        show.text = "Shows:"
        show.frame = CGRect(x: 20, y: (integrantes.frame.height)+250, width: larguraTela, height: 30)
        self.view.addSubview(show)
       
        shows.frame = CGRect(x: 40, y: Int((show.frame.maxY)-5), width: Int(larguraTela), height: (banda.shows?.count)!*40)
        shows.dataSource = self
        shows.delegate = self
        shows.register(UITableViewCell.self, forCellReuseIdentifier: "showsCell")
        shows.layer.zPosition = -2
        self.view.addSubview(shows)

    }
    
    func back(_ sender: Any){
        dismiss(animated: false, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if tableView == integrantes{
            return (banda.integrantes?.count)!
        }
        if tableView == shows{
            return (banda.shows?.count)!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if tableView == integrantes{
            let cell = tableView.dequeueReusableCell(withIdentifier: "integrantesCell", for: indexPath as IndexPath)
            cell.textLabel?.text = self.banda.integrantes?[indexPath.item]
            return cell
        }
        
        if tableView == shows{
            let cell = tableView.dequeueReusableCell(withIdentifier: "showsCell", for: indexPath as IndexPath)
            cell.textLabel?.text = self.banda.shows?[indexPath.item]
            return cell
        }
        
        return UITableViewCell()
        
    }

}
