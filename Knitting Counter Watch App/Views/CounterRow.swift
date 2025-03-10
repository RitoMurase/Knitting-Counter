//
//  CounterRow.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/04/07.
//

import SwiftUI

struct CounterRow: View {
    var counter: KnittingCounter
    
    var body: some View {
        HStack{
            Spacer()
            Text(counter.name)
            Text("\(counter.count)/\(counter.targetCount)")
            Circle().foregroundColor(Color(hex: counter.colorDescription))
                .frame(width: 10)
            Spacer()
        }
        
    }
}

#Preview {
    CounterRow(counter: KnittingCounter(name: "test", targetCount: 10, colorDescription: "blue"))
}
