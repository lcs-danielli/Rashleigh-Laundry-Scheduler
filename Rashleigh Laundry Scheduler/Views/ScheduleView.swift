//
//  ScheduleView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var viewModel: LaundryViewModel
    
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
                                        if let index = viewModel.bookings.firstIndex(where: { $0.id == booking.id }) {
                                            let removed = viewModel.bookings.remove(at: index)
                                            viewModel.persistBookings()
                                            viewModel.histories.insert(removed, at: 0)
                                            viewModel.persistHistories()
                                        }
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
                .environmentObject(viewModel)
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
        .environmentObject(LaundryViewModel())
}
