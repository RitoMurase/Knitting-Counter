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
    
    @Binding var path: NavigationPath
        
    var body: some View {
        VStack{
            HStack{
                Text("Name")
                TextField("Name", text: $nameFieldInput)
            }
            HStack{
                Text("Target Count")
                TextField("Target Count", value: $targetCountFieldInput, format: .number)
            }
            Button(action: {
                add(name: nameFieldInput, targetCount: targetCountFieldInput)
                path.removeLast()
                
            }, label: {Text("Add")})
        }
    }
    
    private func add(name:String, targetCount: Int) {
        let data = KnittingCounter(name: name, targetCount: targetCount)
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
