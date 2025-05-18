//
//  ScheduleView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var viewModel: LaundryViewModel

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.histories.isEmpty {
                    ContentUnavailableView(
                        "No History",
                        systemImage: "clock.arrow.circlepath",
                        description: Text("No Laundry History")
                    )
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(viewModel.histories) { history in
                                VStack(alignment: .leading) {
                                    Text(history.date)
                                        .font(.headline)
                                    Text("\(history.userID)  \(history.startTime)–\(history.endTime)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    //Chat GPT help the format of the text
                                }
                                .padding(.vertical, 8)
                                Divider()
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("History")
            .background(Color.blue.opacity(0.04))
        }
    }
}

#Preview {
        HistoryView()
        .environmentObject(LaundryViewModel())
}



//import SwiftUI
//
//struct HistoryView: View {
//    @Environment(LaundryViewModel.self) var viewModel
//    
//    var body: some View {
//        NavigationStack {
//            Group {
//                if viewModel.histories.isEmpty {
//                    ContentUnavailableView(
//                        "No History",
//                        systemImage: "heart.slash"
//                    )
//                } else {
//                    ScrollView {
//                        VStack(alignment: .leading, spacing: 12) {
//                            ForEach(viewModel.histories) { history in
//                                VStack(alignment: .leading, spacing: 4) {
//                                    Text(history.date)
//                                        .font(.headline)
//                                    Text("\(history.userID)  \(history.startTime)–\(history.endTime)")
//                                        .font(.subheadline)
//                                        .foregroundColor(.secondary)
//                                    //Chat GPT help the format of the text
//                                }
//                                .padding(.vertical, 4)
//                            }
//                            .listStyle(.plain)
//                        }
//                }
//            }
//            .background(Color.blue.opacity(0.04))
//            .navigationTitle("History")
//        }
//    }
//}
//
//#Preview {
//    HistoryView()
//        .environment(LaundryViewModel())
//}
