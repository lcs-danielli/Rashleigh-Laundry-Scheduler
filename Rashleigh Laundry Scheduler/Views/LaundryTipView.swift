//
//  LaundryTipView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-05-18.
//

import SwiftUI

struct LaundryTipView: View {
    @EnvironmentObject var viewModel: LaundryViewModel

    var body: some View {
        VStack {
            Text("🧺 Laundry Tip for today")
                .font(.title2)
                .padding(.vertical)

            if let tip = viewModel.currentTip {
                Text(tip.slip.advice)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                Text("Loading tip...💭")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.02))
        .cornerRadius(20)
        // function of fetching the laundry tip
        .task {
            await viewModel.fetchLaundryTip()
        }
    }
}

#Preview{
    LaundryTipView()
        .environmentObject(LaundryViewModel())
}
