//
//  GerenciadorDeTarefasSwiftUIApp.swift
//  GerenciadorDeTarefasSwiftUI
//
//  Created by João Pedro Feijó on 8/10/22.
//

import SwiftUI

@main
struct GerenciadorDeTarefasSwiftUIApp: App {
    @State var tarefas : [Tarefa] = []
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationView {
                    ContentView(tarefasB: $tarefas)

                }
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Task")
                }
                
                NavigationView {
                    PaginaInicial(tarefas: $tarefas)
                }
                .tabItem {
                    Image(systemName: "pencil.circle.fill")
                    Text("Tasks")
                }
            }
        }
    }
}
