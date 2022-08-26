//
//  PaginaInicial.swift
//  GerenciadorDeTarefasSwiftUI
//
//  Created by João Pedro Feijó on 8/12/22.
//

import SwiftUI



struct PaginaInicial: View {
    
    //var classeA = ContentView()
    @State private var tarefas: [Tarefa] = [Tarfa(nome:"adhso", addInfo: " jaisjia")]
    
    @State private var showDetails = false
    
    var body: some View {
        //tentativa de usar o conteudo do array da outra classe
        //tarefas = ContentView().tarefasB
        VStack() {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    if tarefas.isEmpty {
                        Text("You don't have any tasks assigned")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                    } else {
                        ForEach(tarefas) { task in
                            Button {
                                showDetails.toggle()
                            } label: {
                                Text(task.nome)
                                    .frame(width: 300, height: 40)
                            }
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .tint(.indigo)
                            .textFieldStyle(.roundedBorder)
                            if showDetails {
                                HStack{
                                    Text(task.addInfo)
                                        .font(.largeTitle)
                                    
                    //tentativa de criar o botão de remover a tarefa
    //                                Button{
    //                                    tarefas.remove(task)
    //                                } label: {
    //                                    Text("Done")
    //                                }
                                    
                                    
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Tasks"))
        }
    }
}

struct PaginaInicial_Previews: PreviewProvider {
    static var previews: some View {
        PaginaInicial()

    }
}
