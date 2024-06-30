//
//  Knitting_CounterApp.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/04/06.
//

import SwiftUI

@main
struct Knitting_Counter_Watch_AppApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: KnittingCounter.self)
        }
    }
}
