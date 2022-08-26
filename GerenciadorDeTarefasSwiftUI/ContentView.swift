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
    @State public var tarefasB: [Tarefa] = []
    @FocusState private var inputFocused: Bool
    
    var body: some View {
//        var t = Tarefa(nome: "Null",addInfo: "Null")
            
        VStack{
            TextField("Name", text: $nome)
            TextField("Description", text: $addInfo)
            Button("Add Task") {
                submit()
                nome = ""
                addInfo = ""
            }
            .tint(.indigo)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .keyboardShortcut(.defaultAction)
        }
        .textFieldStyle(.roundedBorder)
        .disableAutocorrection(true)
        .frame(width: 380, alignment: .trailing)
        .focused($inputFocused)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension ContentView {
    func submit(){
        tarefasB.append(Tarefa(nome: nome, addInfo: addInfo))
        print(Tarefa(nome: nome, addInfo: addInfo))
        print(tarefasB)
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
