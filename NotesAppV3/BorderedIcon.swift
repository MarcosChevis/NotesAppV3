//
//  BorderedIcon.swift
//  NotesAppV3
//
//  Created by Marcos Chevis on 16/11/23.
//

import SwiftUI

struct BorderedIcon: View {
    let string: String
    var body: some View {
        Image(systemName: string)
            .font(.title3)
            .foregroundColor(.accentColor)
            .padding(6)
            .background(RoundedRectangle(cornerRadius: 6, style: .continuous).foregroundStyle(Color.background))
            .padding(.vertical)
    }
}

#Preview {
    BorderedIcon(string: "trash")
}
