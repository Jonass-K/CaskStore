//
//  ContentView.swift
//  CaskStore_App
//
//  Created by Jonas Kaiser on 03.05.22.
//

import SwiftUI
 
struct ContentView: View {
    @State var query: String = "Firefox"
    
    var body: some View {
        HStack {
            SideBar()
                .frame(width: 220.0, alignment: .leading)
            SearchView(query: $query)
        }
        .frame(minWidth: 1000, idealWidth: 1000, minHeight: 600, idealHeight: 600, alignment: .center)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
