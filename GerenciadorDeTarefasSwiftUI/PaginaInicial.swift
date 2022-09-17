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
                                Label(task.nome, systemImage: decideIcone(valorInserido: task.tipoTarefa))
                                    .frame(width: 300, height: 40)
                            }
                            .tint(decideCor(valorInserido: task.tipoTarefa))
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .textFieldStyle(.roundedBorder)
                        }
                        Button{
                            tarefas.removeAll()
                        } label: {
                            Label("Clear", systemImage: "trash.fill")
                        }
                        .tint(.red)
                        .buttonStyle(.bordered)
                        .keyboardShortcut(.defaultAction)
                        .buttonBorderShape(.capsule)
                    }
                }
            }
            .navigationBarTitle("Tasks")
        }
    }
}

func decideIcone(valorInserido: String) -> String{
    switch valorInserido {
    case "Others":
        return "pencil.tip.crop.circle.badge.plus"
    case "Sports":
        return "figure.walk"
    case "Family":
        return "heart.fill"
    case "Studies":
        return "highlighter"
    case "Health":
        return "pills.fill"
    default:
        return "pencil.tip.crop.circle.badge.plus"
    }
}

func decideCor(valorInserido: String) -> Color{
    switch valorInserido {
    case "Others":
        return Color.indigo
    case "Sports":
        return Color.mint
    case "Family":
        return Color.red
    case "Studies":
        return Color.yellow
    case "Health":
        return Color.green
    default:
        return Color.indigo
    }
}

//struct PaginaInicial_Previews: PreviewProvider {
//    static var previews: some View {
//        PaginaInicial($tarefas = [Tarefa])
//
//    }
//}
