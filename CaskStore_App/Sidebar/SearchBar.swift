//
//  SearchBar.swift
//  CaskStore_App
//
//  Created by Jonas Kaiser on 03.05.22.
//

import SwiftUI


struct SearchBar: View {
    @Binding var text: String
    @State var focus = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6.0)
                .stroke(Color.onSecondaryContainer, lineWidth: 0.0)
                .background(
                    RoundedRectangle(cornerRadius: 6.0)
                        .fill(Color.secondaryContainer.opacity(0.5))
                )
                .frame(height: 30.0, alignment: .center)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(Font.callout)
                    .foregroundColor(.onSecondaryContainer)
                ZStack(alignment: .leading) {
                    Text(text == "" ? "Suchen" : "")
                        .foregroundColor(Color.onSecondaryContainer)
                    TextField("", text: $text, onEditingChanged: { focus in
                        self.focus = focus
                    })
                        .foregroundColor(Color.secondaryFine)
                        .textFieldStyle(.plain)
                }
                
                Spacer()
                
                if text != "" {
                    Image(systemName: "xmark.circle.fill")
                        .font(Font.callout)
                        .foregroundColor(.onSecondaryContainer)
                        .onTapGesture {
                            text = ""
                        }
                }
            }
            .padding(6.0)
            .padding(.horizontal, 2.0)
        }
    }
}

struct SearchBar_PreviewHelper: View {
    @State var query = ""
    
    var body: some View {
        SearchBar(text: $query)
    }
}

struct SearchBar_Preview: PreviewProvider {
    static var previews: some View {
       SearchBar_PreviewHelper()
    }
}
