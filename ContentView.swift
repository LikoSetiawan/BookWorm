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
    
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    @State private var addBookModal = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(books){ book in
                    NavigationLink(value: book){
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("BookWorm")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add", systemImage: "plus"){
                        addBookModal.toggle()
                    }
                }
            }
            .sheet(isPresented: $addBookModal){
                AddBookView()
            }
            .navigationDestination(for: Book.self){ book in
                    DetailView(book: book)
            }
            
        }
    }
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets {
            
            let book = books[offset]
            
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
