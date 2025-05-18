//
//  ContentView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI
import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

let bookingsFileLabel = "BookingsData.json"
// Same format as Joke finder

@Observable

class LaundryViewModel {
    var bookings: [Information] = [
        exampleBook1,
        exampleBook2
    ]
    
    var histories: [Information] = [
        exampleHistory1,
        exampleHistory2
    ]
    
    func addBooking(date: String, user: String, start: String, end: String) {
        let newBooking = Information(
                date: date,
                userID: user,
                startTime: start,
                endTime: end
        )
        bookings.append(newBooking)
    }

}

