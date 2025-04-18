//
//  LaundryItem.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import Foundation

struct Booking: Identifiable {
    let id = UUID()
    let date: String
    let userID: String
    let startTime: String
    let endTime: String
}

let exampleBook1 = Booking(
    date: "Sunday",
    userID: "lucuszhu@lcs.on.ca",
    startTime: "13:00",
    endTime: "15:00"
)

let exampleBook2 = Booking(
    date: "Monday",
    userID: "DavidShan@lcs.on.ca",
    startTime: "18:00",
    endTime: "20:00"
)
