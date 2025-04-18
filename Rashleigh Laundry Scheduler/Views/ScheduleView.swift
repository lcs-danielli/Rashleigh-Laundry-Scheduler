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
                    List(viewModel.bookings) { currentBooking in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentBooking.date)
                                .font(.headline)
                            Text("\(currentBooking.userID)  \(currentBooking.startTime)–\(currentBooking.endTime)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            //Chat GPT help the format of the text
                        }
                        .padding(.vertical, 4)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Scedule")
        }
    }
}

#Preview {
    ScheduleView()
        .environment(LaundryViewModel())
}
