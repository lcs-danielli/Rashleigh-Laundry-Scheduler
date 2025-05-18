//
//  LandingView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI

struct LandingView: View {
    
    @State var currentTab = 2
    
    @State var occupacity = false
    
    var body: some View {
        
        TabView(selection: $currentTab) {
            
            ScheduleView()
                .tabItem {
                    Label {
                        Text("Scheduler")
                    } icon: {
                        Image(systemName: "book.circle.fill")
                    }
                    
                }
                .tag(1)
            
            Group {
                if occupacity {
                    OccupiedLaundryView()
                } else {
                    IdleLaundryView()
                }
            }
            .tabItem {
                Label {
                    Text("Occupacity")
                } icon: {
                    Image(systemName: "gearshape.fill")
                }
                
            }
            .tag(2)
            
            HistoryView()
                .tabItem {
                    Label {
                        Text("History")
                    } icon: {
                        Image(systemName: "clock.fill")
                    }
                    
                }
                .tag(3)
            
        }
    }
}


#Preview {
    LandingView()
        .environmentObject(LaundryViewModel())
}
