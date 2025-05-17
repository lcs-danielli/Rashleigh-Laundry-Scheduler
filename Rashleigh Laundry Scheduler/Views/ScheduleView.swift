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
                                }
                                .padding(.vertical, 8)
                            }
                            NavigationLink(destination:
                                            BookingView()
                                .environment(viewModel)
                            ) {
                                Text("New Booking")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.green.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(22)
                            }
                            .padding(.top, 460)
                        }
                        .listStyle(.plain)
                        .padding()
                    }
                }
            }
            .navigationTitle("Schedule")
            .background(Color.blue.opacity(0.04))
        }
    }
}

#Preview {
    ScheduleView()
        .environment(LaundryViewModel())
}
