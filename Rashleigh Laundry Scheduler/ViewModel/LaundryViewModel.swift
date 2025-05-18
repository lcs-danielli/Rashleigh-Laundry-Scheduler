//
//  ContentView.swift
//  Rashleigh Laundry Scheduler
//
//  Created by 李泽宇 on 2025-04-18.
//

import SwiftUI

class LaundryViewModel: ObservableObject {
    
    @Published var currentTip: LaundryTip?
    
    @Published var bookings: [Information] = []
    
    @Published var histories: [Information] = []
    
    func addBooking(date: String, user: String, start: String, end: String) {
        let newBooking = Information(
            date: date,
            userID: user,
            startTime: start,
            endTime: end
        )
        bookings.append(newBooking)
        persistBookings()
    }
    
    init() {
        // save booking
        loadBookings()
        loadHistories()
    }
    
    // Same idea of joke fetching
    func fetchLaundryTip() async {
        let endpoint = "https://api.adviceslip.com/advice"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }
        
        // 2. Fetch the raw data from the URL
        //
        // Network requests can potentially fail (throw errors) so
        // we complete them within a do-catch block to report errors
        // if they occur.
        //
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8)!)
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(LaundryTip.self, from: data)
            
            DispatchQueue.main.async {
                self.currentTip = decodedData
            }
            
        } catch {
            print("Could not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            print(error)
        }
    }
    
    func persistHistories() {
        let filename = getDocumentsDirectory().appendingPathComponent(historyFileLabel)
        print(filename)
        print("Persisting histories to:")
        
        do {
            // encoder created
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let data = try encoder.encode(self.histories)
            
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print(error)
            print("Error persisting bookings:")
        }
    }
    
    func loadHistories() {
        
        let filename = getDocumentsDirectory().appendingPathComponent(historyFileLabel)
        
        print("Loading histories from:")
        print(filename)
        
        do {
            let data = try Data(contentsOf: filename)
            
            print("Got data from file, contents are:")
            print(String(data: data, encoding: .utf8)!)
            
            self.histories = try JSONDecoder().decode([Information].self, from: data)
            
        } catch {
            
            print(error)
            print("Could not load histories:")
            
            self.histories = []
        }
    }
    
    // Same format as Joke persisting
    func persistBookings() {
        let filename = getDocumentsDirectory().appendingPathComponent(bookingsFileLabel)
        print(filename)
        print("Persisting bookings to:")
        
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

