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
    
    
    init() {
        // save booking
        loadBookings()
    }
    
    func addBooking(date: String, user: String, start: String, end: String) {
        let newBooking = Information(
            date: date,
            userID: user,
            startTime: start,
            endTime: end
        )
        bookings.append(newBooking)
    }
    
    //func deleteBooking
    
    
    // Same format as Joke persisting
    func persistBookings() {
        let filename = getDocumentsDirectory().appendingPathComponent(bookingsFileLabel)
        print("Persisting bookings to:", filename)
        
        do {
            // encoder created
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let data = try encoder.encode(self.bookings)
            
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            
            print("Wrote data to file, contents are:")
            print(String(data: data, encoding: .utf8)!)
            print("Saved bookings successfully.")
        } catch {
            
            print(error)
            print("Error persisting bookings:")
        }
    }
    
    //  Load bookings from disk into the array (or start empty)
    func loadBookings() {
        
        let filename = getDocumentsDirectory().appendingPathComponent(bookingsFileLabel)
        
        print("Loading bookings from:")
        print(filename)
        
        do {
            let data = try Data(contentsOf: filename)
            
            print("Got data from file, contents are:")
            print(String(data: data, encoding: .utf8)!)
            
            self.bookings = try JSONDecoder().decode([Information].self, from: data)
            
        } catch {
            
            print(error)
            print("Could not load bookings, initializing empty. Error:")
            
            self.bookings = []
        }
    }
}

