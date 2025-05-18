//
//  Rashleigh_Laundry_SchedulerApp.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI

@main
struct Rashleigh_Laundry_SchedulerApp: App {
    @StateObject var viewModel = LaundryViewModel()

    var body: some Scene {
        WindowGroup {
            ScheduleView()
                .environmentObject(viewModel)
        }
    }
}


