//
//  IdleLaundryView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-19.
//
//

import SwiftUI

struct OccupiedLaundryView: View {
    
    var body: some View {
        
        NavigationStack {
            
            VStack() {
                
                Spacer()
                
                Text("Occupied")
                    .font(.largeTitle)
                    .padding()
                
                Text("Sorry, the machine is not avaliable right now")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                
                
                Spacer()
                
                LaundryTipView()
                
            }
            .shadow(radius: 5)
            .padding()
            .navigationTitle("Machine Status")
            .background(Color.red.opacity(0.2))
            
        }
        
    }
}

#Preview {
    OccupiedLaundryView()
        .environmentObject(LaundryViewModel())
}

