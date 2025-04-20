//
//  ScheduleView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI

struct HistoryView: View {
    @Environment(LaundryViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.histories.isEmpty {
                    ContentUnavailableView(
                        "No History",
                        systemImage: "heart.slash"
                    )
                } else {
                    List(viewModel.histories) { currentHistory in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentHistory.date)
                                .font(.headline)
                            Text("\(currentHistory.userID)  \(currentHistory.startTime)–\(currentHistory.endTime)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            //Chat GPT help the format of the text
                        }
                        .padding(.vertical, 4)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("History")
        }
    }
}

#Preview {
    HistoryView()
        .environment(LaundryViewModel())
}
