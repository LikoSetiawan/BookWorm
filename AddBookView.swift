//
//  AddBookView.swift
//  BookWorm
//
//  Created by Liko Setiawan on 30/03/24.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Book Title ", text: $title)
                    TextField("Book Author ", text: $author)
                    
                    Picker("Pick Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section("Write a Review"){
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                    
                    Picker("Give Rating", selection: $rating){
                        ForEach(0..<6){
                            Text(String($0))
                        }
                    }
                }
                
                Section{
                    Button("Add book"){
                        let addBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date.now)
                        modelContext.insert(addBook)
                        
                        dismiss()
                    }
                }
                .disabled(title.isReallyEmpty || author.isReallyEmpty || review.isReallyEmpty)
            }
            .navigationTitle("Bookworm")
        }
    }
}



extension String{
    var isReallyEmpty: Bool{
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

#Preview {
    AddBookView()
}
