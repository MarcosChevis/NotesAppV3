//
//  ContentView.swift
//  NotesAppV3
//
//  Created by Marcos Chevis on 14/11/23.
//

import SwiftUI
import SwiftData

struct AllNonesView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var notes: [Note]
    @Binding var tags: [Tag]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Tags")
                    .padding(.leading)
                ScrollView(.horizontal) {
                    tagsView()
                }
                notesView()
            }
            .padding(.leading)
        }
        .background(Color.background, ignoresSafeAreaEdges: .all)
        .navigationTitle("Notes")
        .toolbar {
            Button(action: {}, label: {
                Image(systemName: "gearshape")
            })
           
        }
    }
    
    @ViewBuilder
    private func notesView() -> some View {
        Text("Notes")
            .padding(.leading)
        ForEach(notes) { note in
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                    .padding([.top, .leading])
                HStack {
                    Text(note.content)
                        .padding(.leading)
                }
                Spacer()
                HStack {
                    Spacer()
                    BorderedIcon(string: "trash")
                    BorderedIcon(string: "square.and.arrow.up")
                        .padding(4)
                    BorderedIcon(string: "square.and.pencil")
                        .padding(.trailing)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: 7000)
            .background(RoundedRectangle(cornerRadius: 8, style: .continuous).foregroundStyle(.white))
            .padding([.top, .horizontal])
        }
    }
    
    @ViewBuilder
    private func tagsView() -> some View {
        LazyHStack {
            ForEach(tags) { tag in
                Text("#\(tag.name)")
                    .font(.callout)
                    .bold()
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 4, style: .continuous).foregroundStyle(.white))
                    .padding([.vertical, .leading])
            }
        }
    }
}

#Preview {
    NavigationStack {
        AllNonesView(notes: .constant([]), tags: .constant([]))
            .modelContainer(for: Note.self, inMemory: true)
    }
}
