//
//  Laundry.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-05-18.
//

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

let bookingsFileLabel = "BookingsData.json"
// Same format as Joke finder
let historyFileLabel = "HistoryData.json"
