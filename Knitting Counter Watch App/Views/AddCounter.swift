//
//  AddCounter.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/04/13.
//

import SwiftUI
import SwiftData

struct AddCounter: View {
    @Environment(\.modelContext) private var context
    @State private var nameFieldInput = ""
    @State private var targetCountFieldInput = 100
    @State private var color = Color(red: 0.0, green: 0.0, blue: 1.0, opacity: 0.9)
    
    @Binding var path: NavigationPath
        
    var body: some View {
        ScrollView(.vertical){
            HStack{
                Text("Name")
                TextField("Name", text: $nameFieldInput)
            }
            HStack{
                Text("Target Count")
                TextField("Target Count", value: $targetCountFieldInput, format: .number)
            }
            HStack{
                Text("Color")
                SelectColor(color: $color)
            }
            Button(action: {
                add(name: nameFieldInput, targetCount: targetCountFieldInput, color: color)
                path.removeLast()
                
            }, label: {Text("Create")}).accessibility(identifier: "AddCounter")
        }
    }
    
    private func add(name:String, targetCount: Int, color: Color) {
        let data = KnittingCounter(name: name, targetCount: targetCount, colorDescription: String(color.description))
        context.insert(data)
        
    }
}

#Preview {
//    @State var path = NavigationPath()
//    path.append(0)
//    AddCounter(path: $path)
//        .modelContainer(for: KnittingCounter.self)
    Text("")
}
