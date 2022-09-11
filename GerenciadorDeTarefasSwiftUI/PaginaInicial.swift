//
//  PaginaInicial.swift
//  GerenciadorDeTarefasSwiftUI
//
//  Created by João Pedro Feijó on 8/12/22.
//

import SwiftUI



struct PaginaInicial: View {

    @Binding var tarefas : [Tarefa]
    
    
    var body: some View {
        
        VStack() {
            NavigationView {
                ScrollView(. vertical, showsIndicators: false) {
                    if tarefas.isEmpty {
                        Text("You don't have any tasks assigned")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                    } else {
                        ForEach(tarefas) { task in
                            NavigationLink{
                                List{
                                    Section{
                                        Text(task.addInfo)
                                        Text(task.tipoTarefa)
                                    } header: {
                                        Text(task.nome)
                                    }
                                    .headerProminence(.increased)
                                }
                                .listStyle(.insetGrouped)
                            } label: {
                                Label(task.nome, systemImage: "pencil.tip.crop.circle.badge.plus")
                                    .frame(width: 300, height: 40)
                            }
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .textFieldStyle(.roundedBorder)
                        }
                        Button("Remove tasks"){
                            tarefas.removeAll()
                        }
                        .tint(.indigo)
                        .buttonStyle(.borderedProminent)
                        .keyboardShortcut(.defaultAction)
                    }
                }
            }
            .navigationBarTitle("Tasks")
        }
    }
}

//struct PaginaInicial_Previews: PreviewProvider {
//    static var previews: some View {
//        PaginaInicial($tarefas = [Tarefa])
//
//    }
//}
