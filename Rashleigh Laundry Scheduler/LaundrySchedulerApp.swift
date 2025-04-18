//
//  Rashleigh_Laundry_SchedulerApp.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI

@main
struct LaundrySchedulerApp: App {
    @State var viewModel = LaundryViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ScheduleView()
                    .environment(viewModel)
            }
        }
    }
}

