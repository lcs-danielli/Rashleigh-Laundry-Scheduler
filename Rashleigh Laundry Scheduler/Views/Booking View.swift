//
//  Booking View.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-05-17.
//

import SwiftUI

struct BookingView: View {
    @Environment(LaundryViewModel.self) var viewModel
    
    @State var date      = ""
    @State var userID    = ""
    @State var startTime = ""
    @State var endTime   = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Group {
                    TextField("Date (Month, Day)", text: $date)
                    TextField("User (email address)", text: $userID)
                    TextField("Start Time (Hour, minute)", text: $startTime)
                    TextField("End (Hour, minute)", text: $endTime)
                }
                .padding()
                .textFieldStyle(.roundedBorder)
                
                Button {
                    // Add booking to the ViewModel
                    viewModel.addBooking(
                        date: date,
                        user: userID,
                        start: startTime,
                        end:   endTime
                    )
                    // Clear the previous booking (spelling mobile)
                    date = ""
                    userID = ""
                    startTime = ""
                    endTime = ""
                } label: {
                    Text("Book")
                }
                .padding()
                .disabled(
                    date.isEmpty ||
                    userID.isEmpty ||
                    startTime.isEmpty ||
                    endTime.isEmpty
                )
                .buttonStyle(.borderedProminent)

                
                Spacer()
            }
            .padding()
            .background(Color.blue.opacity(0.04))
            .navigationTitle("New Booking")
        }
    }
}

#Preview {
    BookingView()
        .environment(LaundryViewModel())
}
