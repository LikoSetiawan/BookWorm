//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Liko Setiawan on 26/03/24.
//

import SwiftData
import SwiftUI


@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
        
    }
}
