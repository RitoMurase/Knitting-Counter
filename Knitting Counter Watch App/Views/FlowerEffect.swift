//
//  FlowerEffect.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/06/30.
//

import SwiftUI

struct FlowerEffect: View {
    @Binding var isAchievement: Bool
    var targetCount: Int
    var inputText: String
    private let offsetScale: CGFloat = 2.0
    
    init(isAchievement: Binding<Bool>, targetCount: Int){
        self._isAchievement = isAchievement
        self.targetCount = targetCount
        self.inputText = ""
        if(targetCount < 10){
            self.inputText = "💐💐💐"
        } else if(targetCount >= 10 && targetCount < 30){
            self.inputText = "🐝🐝🐝"
        } else if(targetCount >= 30 && targetCount < 50){
            self.inputText = "🦔🦔🦔"
        } else if(targetCount >= 50 && targetCount < 100){
            self.inputText = "🐶🐶🐶"
        } else {
            self.inputText = "🐳🐳🐳"
        }
    }
    
    var body: some View {
        Text(inputText).visualEffect { content, geometryProxy in
            content.opacity(isAchievement ? 1.0: 0.0).offset(y: geometryProxy.size.height*(-1*offsetScale))
        }.animation(.easeIn, value: isAchievement)
        Text(inputText).visualEffect { content, geometryProxy in
            content.opacity(isAchievement ? 1.0: 0.0).offset(y: geometryProxy.size.height*(offsetScale))
        }.animation(.easeIn, value: isAchievement)
        
    }
    
}

#Preview {
    //FlowerEffect()
    Text("")
}
