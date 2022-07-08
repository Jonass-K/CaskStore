//
//  SearchView.swift
//  CaskStore_App
//
//  Created by Jonas Kaiser on 05.07.22.
//

import SwiftUI

struct SearchView: View {
    @Binding var query: String
    var title: String { "Ergebnisse für \"\(query)\"" }
    @State var caskSearchResults = [
        CaskSearchResult(id: "1",
                         title: "Firefox",
                         caskIcon: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Firefox_logo%2C_2019.svg/231px-Firefox_logo%2C_2019.svg.png",
                         caskPreviewImage: "https://www.mozilla.org/media/img/firefox/features/index/features-hero-high-res.d60944a619a4.png",
                         category: "Dienstprogramme"),
        CaskSearchResult(id: "2",
                         title: "Firefox",
                         caskIcon: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Firefox_logo%2C_2019.svg/231px-Firefox_logo%2C_2019.svg.png",
                         caskPreviewImage: "https://www.mozilla.org/media/img/firefox/features/index/features-hero-high-res.d60944a619a4.png",
                         category: "Dienstprogramme"),
        CaskSearchResult(id: "3",
                         title: "Firefox",
                         caskIcon: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Firefox_logo%2C_2019.svg/231px-Firefox_logo%2C_2019.svg.png",
                         caskPreviewImage: "https://www.mozilla.org/media/img/firefox/features/index/features-hero-high-res.d60944a619a4.png",
                         category: "Dienstprogramme"),
        CaskSearchResult(id: "3",
                         title: "Firefox",
                         caskIcon: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Firefox_logo%2C_2019.svg/231px-Firefox_logo%2C_2019.svg.png",
                         caskPreviewImage: "https://www.mozilla.org/media/img/firefox/features/index/features-hero-high-res.d60944a619a4.png",
                         category: "Dienstprogramme"),
        CaskSearchResult(id: "3",
                         title: "Firefox",
                         caskIcon: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Firefox_logo%2C_2019.svg/231px-Firefox_logo%2C_2019.svg.png",
                         caskPreviewImage: "https://www.mozilla.org/media/img/firefox/features/index/features-hero-high-res.d60944a619a4.png",
                         category: "Dienstprogramme"),
        CaskSearchResult(id: "3",
                         title: "Firefox",
                         caskIcon: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Firefox_logo%2C_2019.svg/231px-Firefox_logo%2C_2019.svg.png",
                         caskPreviewImage: "https://www.mozilla.org/media/img/firefox/features/index/features-hero-high-res.d60944a619a4.png",
                         category: "Dienstprogramme"),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 35.0))
                .fontWeight(.medium)
                .padding(.horizontal, 30.0)
            Divider()
                .padding(.bottom)
                .padding(.horizontal, 30.0)
            
            Grid(selection: $caskSearchResults) { cask in
                SearchResult(cask)
            }
            
            HStack {
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal, 15.0)
        .padding(.top, 60.0)
    }
}

struct SearchView_PreviewsHelper: View {
    @State var query: String = "Firefox"
    
    var body: some View {
        SearchView(query: $query)
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView_PreviewsHelper()
    }
}

struct CaskSearchResult: Identifiable {
    var id: String
    var title: String
    var caskIcon: String
    var caskPreviewImage: String
    var category: String
}
