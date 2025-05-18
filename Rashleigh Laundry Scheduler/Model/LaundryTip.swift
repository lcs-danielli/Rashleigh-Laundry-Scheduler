//
//  LaundryTip.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-05-18.
//

import Foundation

struct LaundryTip: Codable {
    struct Slip: Codable {
        let advice: String
    }
    let slip: Slip
}

// Smae idea of 👇
//var setupAndPunchline: String {
//    
//    if let setup = self.setup, let punchline = self.punchline {
//        return "\(setup)\n\n\(punchline)"
//    } else {
//        return ""
//    }
//    
//}
//    
//}
