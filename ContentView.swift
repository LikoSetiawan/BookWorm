//
//  ContentView.swift
//  BookWorm
//
//  Created by Liko Setiawan on 26/03/24.
//

import SwiftData
import SwiftUI



struct ContentView: View {
   
    @Environment (\.modelContext) var modelContext
    
    @Query var books : [Book]
    
    @State private var addBookModal = false
    
    var body: some View {
        NavigationStack{
            Text("Count the books : \(books.count)")
                .navigationTitle("BookWorm")
                .toolbar{
                    Button("Add", systemImage: "plus"){
                        addBookModal.toggle()
                    }
                }
                .sheet(isPresented: $addBookModal){
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}
