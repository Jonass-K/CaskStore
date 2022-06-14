//
//  SideBar.swift
//  CaskStore_App
//
//  Created by Jonas Kaiser on 03.05.22.
//

import SwiftUI

struct SideBar: View {
    @Environment(\.openURL) var openURL
    
    @State var query = ""
    @State var item: Item? = Item.entdecken
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SearchBar(text: $query)
                .padding(.bottom, 20.0)
            
            SideBarItem(item: .entdecken, icon: "star", selected: $item)
            SideBarItem(item: .erstellen, icon: "paintbrush", selected: $item)
            SideBarItem(item: .arbeiten, icon: "paperplane", selected: $item)
            SideBarItem(item: .spielen, icon: "gamecontroller", selected: $item)
            SideBarItem(item: .entwickeln, icon: "hammer", selected: $item)
            SideBarItem(item: .kategorien, icon: "square.grid.2x2", selected: $item)
            SideBarItem(item: .updates, icon: "square.and.arrow.down", selected: $item)
            
            Spacer()
            SideBarItem(text: "CaskStore on GitHub", icon: "externaldrive.connected.to.line.below")
                .onTapGesture {
                    openURL(URL(string: "https://github.com/Jonass-K/CaskStore")!)
                }
        }
        .padding()
        .padding(.top, 18.0)
        .overlay(
            Rectangle()
                .frame(width: 1, height: nil, alignment: .trailing)
                .foregroundColor(Color.secondaryContainer), alignment: .trailing
        )
        .background(VisualEffectView().ignoresSafeArea())
    }
}

struct VisualEffectView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        view.state = .active
        view.material = .underWindowBackground

        return view
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
    }
}
