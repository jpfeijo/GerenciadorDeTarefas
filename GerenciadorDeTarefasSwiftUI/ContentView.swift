//
//  ContentView.swift
//  GerenciadorDeTarefasSwiftUI
//
//  Created by João Pedro Feijó on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nome: String = ""
    @State private var addInfo: String = ""
    @State private var tipoTarefa: String = ""
    @Binding var tarefasB: [Tarefa]
    @FocusState private var inputFocused: Bool
    
    enum Tipo: String, CaseIterable, Identifiable {
        case Others, Health, Studies, Family, Sports
        var id: Self { self }
    }

    @State private var selectedType: Tipo = .Others
    
    var body: some View {
        
            List{
                TextField("Task name", text: $nome)
                TextField("Description", text: $addInfo)
                Picker("Task type", selection: $selectedType) {
                    Text("Other").tag(Tipo.Others)
                    Text("Health").tag(Tipo.Health)
                    Text("Studies").tag(Tipo.Studies)
                    Text("Family").tag(Tipo.Family)
                    Text("Sports").tag(Tipo.Sports)
            }
                Button("Add Task") {
                    submit()
                    nome = ""
                    addInfo = ""
                    selectedType = .Others
                }
                .tint(.indigo)
                .buttonStyle(.borderedProminent)
                .keyboardShortcut(.defaultAction)
            }
            .disableAutocorrection(true)
            .focused($inputFocused)
        }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

private extension ContentView {
    func submit(){
        tarefasB.append(Tarefa(nome: nome, addInfo: addInfo, tipoTarefa: selectedType.rawValue))
        if #available(iOS 15, *) {
            inputFocused = false
        } else {
            dismissKeyboard()
        }
    }
}

extension View {
    func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
