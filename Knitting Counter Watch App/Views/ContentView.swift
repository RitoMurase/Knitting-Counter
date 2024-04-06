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

#Preview {
    ContentView()
        .modelContainer(for: KnittingCounter.self)
}
