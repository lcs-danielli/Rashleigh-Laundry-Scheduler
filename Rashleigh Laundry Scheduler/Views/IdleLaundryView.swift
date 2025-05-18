//
//  IdleLaundryView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-19.
//
//

import SwiftUI

struct IdleLaundryView: View {
    @EnvironmentObject var viewModel: LaundryViewModel
    
    var body: some View {
        NavigationStack {
            VStack() {
                
                Spacer()
                
                Text("Idle...")
                    .font(.largeTitle)
                    .padding()
                
                Text("The machine now is avaliable")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                NavigationLink(destination: BookingView()
                    .environmentObject(viewModel)) {
                    Text("Book Now")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(22)
                }

            }
            .shadow(radius: 5)
            .padding()
            .navigationTitle("Machine Status")
            .background(Color.green.opacity(0.2))
        }
        
    }
}


#Preview {
    NavigationStack {
        IdleLaundryView()
            .environmentObject(LaundryViewModel())
    }
}


