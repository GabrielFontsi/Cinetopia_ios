//
//  PerfilViewController.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 04/06/24.
//

import UIKit

class MenuViewController: UIViewController {
    
    var menuScreen: MenuScreen?
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell {
            let menu = listMenu[indexPath.row]
            cell.configurationCell(menu: menu)
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Ação ao selecionar uma célula
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
