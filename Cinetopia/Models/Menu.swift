//
//  Menu.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 06/06/24.
//

import Foundation
import UIKit

struct Menu {
    let id: Int
    let title: String
    let icon: String
}

let listMenu: [Menu] = [
Menu(id: 1, title: "Conta", icon: "perfil"),
Menu(id: 2, title: "Filmes favoritados", icon: "coracao"),
Menu(id: 3, title: "Sair", icon: "sair"),
]
