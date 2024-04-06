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
            Spacer()
        }
        
    }
}

#Preview {
    CounterRow(counter: KnittingCounter(name: "test", targetCount: 10))
}
