//
//  NotesView.swift
//  NotesAppV3
//
//  Created by Marcos Chevis on 16/11/23.
//

import SwiftUI
import SwiftData
import Combine

struct NotesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Note.title) var notes: [Note]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(notes) { note in
                    NoteView(note: note)
                }
                .frame(width: UIScreen.main.bounds.size.width*0.8)
                .background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundStyle(.white))
                .padding()
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .background(Color.background)
        .navigationTitle(notes.enumerated().reduce(0, { partialResult, element in
            if element.1.isVisible {
//                if partialResult == 0 {
                    return element.0 - 1
//                }
            }
            return partialResult
        }).description)
        .onAppear(perform: {
            modelContext.insert(Note(creationDate: .now, lasModificationDate: .now, title: "Title1", content: "Content", tags: [], isVisible: false))
            modelContext.insert(Note(creationDate: .now, lasModificationDate: .now, title: "Title2", content: "Content", tags: [], isVisible: false))
            modelContext.insert(Note(creationDate: .now, lasModificationDate: .now, title: "Title3", content: "Content", tags: [], isVisible: false))
            modelContext.insert(Note(creationDate: .now, lasModificationDate: .now, title: "Title4", content: "Content", tags: [], isVisible: false))
            modelContext.insert(Note(creationDate: .now, lasModificationDate: .now, title: "Title5", content: "Content", tags: [], isVisible: false))
            modelContext.insert(Note(creationDate: .now, lasModificationDate: .now, title: "Title6", content: "Content", tags: [], isVisible: false))
        })
    }
}

#Preview {
    NavigationStack {
        NotesView()
            .modelContainer(for: Note.self, inMemory: true)
    }
}
