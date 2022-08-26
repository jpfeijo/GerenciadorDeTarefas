//
//  Tarefas.swift
//  GerenciadorDeTarefasSwiftUI
//
//  Created by João Pedro Feijó on 8/11/22.
//

import Foundation

struct Tarefa: Identifiable {
    var id: String {
            self.nome
        }
    var nome: String
    var addInfo: String


    init(nome: String, addInfo: String){
        self.nome = nome
        self.addInfo = addInfo
    }
    
    init(nome: String){
        self.nome = nome
        self.addInfo = ""
    }
}
