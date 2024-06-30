//
//  CounterDetail.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/04/07.
//

import SwiftUI
import SwiftData

struct CounterDetail: View {
    @Environment(\.modelContext) private var context
    var counter: KnittingCounter
    @State private var crownValue: Double
    @State private var isAchievement: Bool
    
    init(counter: KnittingCounter) {
        self.counter = counter
        self.crownValue = Double(self.counter.count)
        self.isAchievement = (self.counter.count == self.counter.targetCount)
        }
        
    var body: some View {
        ZStack{
            CircleView(count: counter.count, targetCount: counter.targetCount,
                       color: Color(hex: counter.colorDescription))
            Text("\(counter.count)")
            .font(.system(size: 40))
            .focusable()
            .digitalCrownRotation($crownValue, from: 0.0, through: Double(counter.targetCount), sensitivity: .low)
            .onChange(of: crownValue) { oldValue, newValue in
                update(oldValue: oldValue, newValue: newValue)
                isAchievement = (counter.count == counter.targetCount)
            
            }
            .onTapGesture {
                counter.count = counter.count + 1
                crownValue = crownValue + 1.0
                try? context.save()
            }
            .visualEffect { content, geometryProxy in
                content.rotationEffect(isAchievement ? .degrees(360): .degrees(0))
            }.animation(.smooth.repeatForever(), value: isAchievement)
            FlowerEffect(isAchievement: $isAchievement, targetCount: counter.targetCount)
        }
    }
    
    private func update(oldValue: Double, newValue: Double){
        let progress: Int = Int(newValue) - counter.count
        counter.count = min(max(0, counter.count + progress), counter.targetCount)
        try? context.save()
    }
    
}


#Preview {
    CounterDetail(counter: KnittingCounter(name: "test", targetCount: 10, colorDescription: "#0000FFFF"))
}
