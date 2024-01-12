//
//  NotesView.swift
//  NotesAppV3
//
//  Created by Marcos Chevis on 16/11/23.
//

import SwiftUI

struct NoteView: View {
    @Bindable var note: Note
    
    var body: some View {
        VStack {
            TextField("A Great Title", text: $note.title)
                .font(.title)
                .bold()
            
            TextEditor(text: $note.content)
            Spacer()
            
            HStack {
                BorderedIcon(string: "trash")
                Spacer()
                BorderedIcon(string: "square.and.arrow.up")
            }
        }
        .padding()
        .onAppear {
            note.isVisible = true
            print("Visible \(note.title)")
        }
        .onDisappear {
            note.isVisible = false
            print("NoVisible \(note.title)")
        }

    }
}

#Preview {
    NoteView(
        note: .init(
            creationDate: .now,
            lasModificationDate: .now,
            title: "This is a title",
            content: "This is the content of the note #home",
            tags: [
                .init(
                    name: "home"
                )
            ], isVisible: false
        )
    )
}
