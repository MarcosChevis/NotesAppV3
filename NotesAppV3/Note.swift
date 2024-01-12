//
//  Note.swift
//  NotesAppV3
//
//  Created by Marcos Chevis on 14/11/23.
//

import Foundation
import SwiftData

@Model
class Note {
    var creationDate: Date
    var lasModificationDate: Date
    var title: String
    var content: String
    var tags: [Tag]
    var isVisible: Bool
    
    init(creationDate: Date, lasModificationDate: Date, title: String, content: String, tags: [Tag], isVisible: Bool) {
        self.creationDate = creationDate
        self.lasModificationDate = lasModificationDate
        self.title = title
        self.content = content
        self.tags = tags
        self.isVisible = isVisible
    }
}

@Model
class Tag {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
