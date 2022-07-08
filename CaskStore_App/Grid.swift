//
//  Grid.swift
//  CaskStore_App
//
//  Created by Jonas Kaiser on 05.07.22.
//

import SwiftUI

struct Grid<SelectionValue, Content> : View where SelectionValue : Identifiable, Content : View {
    @Binding var selection: [SelectionValue]
    var rows: [[SelectionValue]] {
        var rows: [[SelectionValue]] = []
        for (i, item) in selection.enumerated() {
            if i % 2 == 0 {
                rows.append([item])
            } else {
                rows[rows.count - 1].append(item)
            }
        }
        return rows
    }
    var content: (SelectionValue) -> Content
    
    var body: some View {
        List(rows) {  row in
            HStack {
                if row.count > 1 {
                    Spacer()
                    content(row[0])
                    content(row[1])
                    Spacer()
                } else if rows.count == 1 {
                    Spacer()
                    content(row[0])
                    Spacer()
                }
            }
        }
    }
}

extension Array: Identifiable where Element: Identifiable {
    public var id: UUID { UUID() }
}
