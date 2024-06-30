//
//  ContentView.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/04/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CounterList()
    }
}

extension Color {
    
    /// 16進数表現の色文字列からColorを生成する。
    /// 色文字列からColorが生成ができない場合は**黒のColor**を生成する。
    /// - Parameters:
    ///   - hex: 16進数の色文字列
    ///   - opacity: 透明度
    init(hex: String) {
        let hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        
        // 文字数が8じゃない場合は不正文字列
        guard hexFormatted.count == 8 else {
            print(hexFormatted)
            self.init(red: 0, green: 0, blue: 0)
            return
        }
        
        var rgbaValue: UInt64 = 0
        // String値をInt64にする。できない場合は不正文字列
        guard Scanner(string: hexFormatted).scanHexInt64(&rgbaValue) else {
            self.init(red: 0, green: 0, blue: 0)
            return
        }
        
        self.init(red: Double((rgbaValue & 0xFF000000) >> 24) / 255.0,
                  green: Double((rgbaValue & 0x00FF0000) >> 16) / 255.0,
                  blue: Double((rgbaValue & 0x0000FF00) >> 8) / 255.0,
                  opacity: Double((rgbaValue & 0x000000FF)) / 255.0)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: KnittingCounter.self)
}
