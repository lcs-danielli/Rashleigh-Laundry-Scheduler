//
//  LaundryItem.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import Foundation

struct Information: Identifiable, Codable {
    var id = UUID()
    let date: String
    let userID: String
    let startTime: String
    let endTime: String
}

let exampleBook1 = Information(
    date: "Sunday",
    userID: "lucuszhu@lcs.on.ca",
    startTime: "13:00",
    endTime: "15:00"
)

let exampleBook2 = Information(
    date: "Monday",
    userID: "DavidShan@lcs.on.ca",
    startTime: "18:00",
    endTime: "20:00"
)

let exampleHistory1 = Information(
    date: "Wednsday",
    userID: "Irisxu@lcs.on.ca",
    startTime: "15:00",
    endTime: "18:00"
)

let exampleHistory2 = Information(
    date: "Thursday",
    userID: "JacobZhan@lcs.on.ca",
    startTime: "22:00",
    endTime: "22:30"
)
