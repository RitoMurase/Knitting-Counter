//
//  SelectColor.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/06/29.
//

import SwiftUI
import Vela

struct SelectColor: View {
    @Binding var color: Color

    var body: some View {
        VelaPicker(color: $color, label: {
            Text(color.description)
        }, allowOpacity: true)
    }
}

#Preview {
//    @State var color : Color = Color.blue
//    SelectColor(color: $color)
    Text("")
}
