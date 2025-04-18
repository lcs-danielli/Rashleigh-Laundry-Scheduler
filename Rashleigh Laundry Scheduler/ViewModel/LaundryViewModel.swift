//
//  ContentView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI
import Foundation

@Observable

class LaundryViewModel {
    var bookings: [Booking] = [
        exampleBook1,
        exampleBook2
    ]
    
    func addBooking(date: String, user: String, start: String, end: String) {
        let newBooking = Booking(
                date: date,
                userID: user,
                startTime: start,
                endTime: end
        )
        bookings.append(newBooking)
    }
}

