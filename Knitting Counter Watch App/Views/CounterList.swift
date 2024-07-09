//
//  CounterList.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/04/07.
//

import SwiftUI
import SwiftData

struct CounterList: View {
    @Environment(\.modelContext) private var context
    @Query private var knitting_counters: [KnittingCounter]
    @State var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path){
            Button("+"){
                        path.append(0)
                    }
                    .navigationTitle("Knitting Counter")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationDestination(for: Int.self, destination: { _ in
                        AddCounter(path: $path)
                    })
            List{
                        ForEach(knitting_counters){ counter in
                            NavigationLink{
                                CounterDetail(counter: counter)
                            } label: {
                                CounterRow(counter: counter)
                            }
                        }
                        .onDelete(perform: { indexSet in
                                            for index in indexSet {
                                                delete(knitting_counter: knitting_counters[index])
                                            }
                                        })
                    }
        }
        
    }
    
    private func delete(knitting_counter:KnittingCounter){
        context.delete(knitting_counter)
    }
    
}

#Preview {
    CounterList()
        .modelContainer(for: KnittingCounter.self)
        //.environment(ModelData())
}
