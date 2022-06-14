//
//  SideBarItem.swift
//  CaskStore_App
//
//  Created by Jonas Kaiser on 03.05.22.
//

import SwiftUI

struct SideBarItem: View {
    let item: Item?
    let text: String
    let icon: String
    @Binding var selected: Item?
    var isActive: Bool {
        item != nil && selected == item
    }
    
    init(item: Item, icon: String, selected: Binding<Item?>) {
        self.item = item
        self.text = item.rawValue.capitalized
        self.icon = icon
        self._selected = selected
    }
    
    init(text: String, icon: String) {
        self.item = nil
        self.text = text
        self.icon = icon
        self._selected = Binding.constant(nil)
    }

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(Font.title3)
                .foregroundColor(Color.accentColor)
                .frame(width: 20.0, alignment: .center)
            Text(text).font(Font.title3)
                .foregroundColor(Color.onPrimaryContainer)
            Spacer()
        }
        .padding(8.0)
        .contentShape(Rectangle())
        .background(isActive ? Color.primaryContainer.opacity(0.5) : Color(white: 0.0, opacity: 0.0))
        .cornerRadius(6.0)
        .onTapGesture {
            guard let item = item else { return }
            selected = item
        }
    }
}

enum Item: String {
    case entdecken
    case erstellen
    case arbeiten
    case spielen
    case entwickeln
    case kategorien
    case updates
}

struct SidebarItem_PreviewHelper: View {
    @State var item: Item? = Item.entdecken
    
    var body: some View {
        Group {
            SideBarItem(item: .entdecken, icon: "star", selected: $item)
            SideBarItem(item: .kategorien, icon: "square.grid.2x2", selected: $item)
        }
    }
}

struct SideBarItem_Previews: PreviewProvider {
    static var previews: some View {
        SidebarItem_PreviewHelper()
    }
}
