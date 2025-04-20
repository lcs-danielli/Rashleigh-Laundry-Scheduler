//
//  IdleLaundryView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-19.
//
//

import SwiftUI

struct IdleMachineView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 18) {
                
                Spacer()
                
                Text("Idle...")
                    .font(.largeTitle)
                
                Text("The machine now is avaliable")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button {
                    // function
                } label: {
                    Text("Book Now")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color.green.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(22)
            }
            .shadow(radius: 5)
            .padding()
            .navigationTitle("Machine Status")
            .background(Color.green.opacity(0.2))
        }
        
    }
}

#Preview {
    IdleMachineView()
}

