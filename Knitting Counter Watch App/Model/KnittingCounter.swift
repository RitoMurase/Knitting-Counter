//
//  KnittingCounterList.swift
//  Knitting Counter Watch App
//
//  Created by 村瀬理都 on 2024/04/07.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class KnittingCounter{
    var name: String
    var targetCount: Int
    var count: Int
    var colorDescription: String
    
    init(name: String, targetCount: Int, colorDescription: String){
        self.name = name
        self.targetCount = targetCount
        self.count = 0
        self.colorDescription = colorDescription
    }
}
