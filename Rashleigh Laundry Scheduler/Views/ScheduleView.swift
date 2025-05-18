//
//  ScheduleView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI

struct ScheduleView: View {
    @Environment(LaundryViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.bookings.isEmpty {
                    ContentUnavailableView(
                        "No Laundry Scheduled",
                        systemImage: "heart.slash",
                        description: Text("Make one booking!")
                    )
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(viewModel.bookings) { booking in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(booking.date)
                                        .font(.headline)
                                    Text("\(booking.userID)  \(booking.startTime)–\(booking.endTime)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    //Chat GPT help the format of the text
                                    
                                    //Chat GPt generate the delete button
                                    Button(role: .destructive) {
                                        viewModel.bookings.removeAll { $0.id == booking.id }
                                        viewModel.persistBookings()
                                    } label: {
                                        Text("Delete")
                                    }
                                    .buttonStyle(.borderless)
                                    .padding(.top, 4)
                                }
                                .padding(.vertical, 8)
                                Divider()
                            }
                            
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Schedule")
            .background(Color.blue.opacity(0.04))
            NavigationLink(destination:
                            BookingView()
                .environment(viewModel)
            ) {
                Text("New Booking")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
            
        }
        
    }
}

#Preview {
    ScheduleView()
        .environment(LaundryViewModel())
}
