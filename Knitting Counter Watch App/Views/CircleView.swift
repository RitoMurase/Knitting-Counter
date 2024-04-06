//
//  CircleView.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/04/14.
//

import SwiftUI

struct CircleView: View {
    var count: Int
    var targetCount: Int
    var color: Color
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 24.0)
            .opacity(0.3)
            .foregroundColor(color)
        Circle()
            .trim(from: 0.0, to: min(CGFloat(count) / CGFloat(targetCount), 1.0))
            .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round, lineJoin: .round))
            .foregroundColor(color)
            .rotationEffect(Angle(degrees: 270.0))
    }
}

#Preview {
    CircleView(count: 3, targetCount: 10, color: .blue)
}
