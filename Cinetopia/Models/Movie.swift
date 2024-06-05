//
//  Movie.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 31/05/24.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
}

let movies: [Movie] = [
    Movie(id: 1, title: "Taxi Drive", image: "taxiDriver", synopsis: "Em Taxi Driver - Motorista de Táxi, Travis Bickle, 26 anos (Robert De Niro) e veterano da Guerra do Vietnã, é um homem solitário no meio da grande Nova York. Logo, ele começa a trabalhar como motorista de táxi no turno da noite, crescendo o sentimento de revolta pela miséria, o vício, a violência e a prostituição que estão sempre à sua volta. Travis começa a cogitar, então, de tomar algumas medidas drásticas para mudar esse cenário.", rate: 9.4, releaseDate: "22 de março de 1976"),
    
    Movie(id: 2, title: "A chamada", image: "menina", synopsis: "A Chamada é novo filme estrelado por Liam Neeson, em mais uma corrida contra o relógio. Em uma manhã aparentemente comum, o telefone toca. Matt Truner (Liam Neeson) atende uma voz misteriosa, que diz a ele que há uma bomba sob seu assento. Ele é instruído a seguir ordens, ou ele e seus filhos morrerão. Matt inicia então um jogo distorcido de vida ou morte. A bomba explodirá se ele sair do carro, matando ele e seus dois filhos no banco de trás e também detonará se ele se recusar a seguir as instruções do bandido. A partir deste momento, Matt além de enfrentar o perigo, precisa dar uma olhada em sua vida para descobrir o que o levou a se tornar alvo de tal ataque.", rate: 8.4, releaseDate: "24 de agosto de 2023"),

    Movie(id: 3, title: "A chamada", image: "taxiDriver", synopsis: "A Chamada é novo filme estrelado por Liam Neeson, em mais uma corrida contra o relógio. Em uma manhã aparentemente comum, o telefone toca. Matt Truner (Liam Neeson) atende uma voz misteriosa, que diz a ele que há uma bomba sob seu assento. Ele é instruído a seguir ordens, ou ele e seus filhos morrerão. Matt inicia então um jogo distorcido de vida ou morte. A bomba explodirá se ele sair do carro, matando ele e seus dois filhos no banco de trás e também detonará se ele se recusar a seguir as instruções do bandido. A partir deste momento, Matt além de enfrentar o perigo, precisa dar uma olhada em sua vida para descobrir o que o levou a se tornar alvo de tal ataque.", rate: 8.4, releaseDate: "24 de agosto de 2023"),
    
    Movie(id: 4, title: "A chamada", image: "menina", synopsis: "A Chamada é novo filme estrelado por Liam Neeson, em mais uma corrida contra o relógio. Em uma manhã aparentemente comum, o telefone toca. Matt Truner (Liam Neeson) atende uma voz misteriosa, que diz a ele que há uma bomba sob seu assento. Ele é instruído a seguir ordens, ou ele e seus filhos morrerão. Matt inicia então um jogo distorcido de vida ou morte. A bomba explodirá se ele sair do carro, matando ele e seus dois filhos no banco de trás e também detonará se ele se recusar a seguir as instruções do bandido. A partir deste momento, Matt além de enfrentar o perigo, precisa dar uma olhada em sua vida para descobrir o que o levou a se tornar alvo de tal ataque.", rate: 8.4, releaseDate: "24 de agosto de 2023"),
    
]
