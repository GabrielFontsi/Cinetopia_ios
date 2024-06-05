//
//  PerfilViewController.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 04/06/24.
//

import UIKit

class MenuViewController: UIViewController {
    
    var menuScreen: MenuScreen?
    
    let sections = ["Geral"]
        let items = [["Meu perfil", "Filmes favoritados", "Deletar conta", "Sair"]]
    let icons = [
            [UIImage(systemName: "person.fill"), UIImage(systemName: "heart"), UIImage(systemName: "trash.fill")],
            [UIImage(systemName: "power")]
        ]
    
    override func loadView() {
        self.menuScreen = MenuScreen()
        self.view = self.menuScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuScreen?.configTableViewDelegate(delegate: self, dataSource: self)
    }
    
}

extension MenuViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.section][indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Ação ao selecionar uma célula
    }
    
}
