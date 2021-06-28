//
//  ContentView.swift
//  SearchBarInSwiftUI
//
//  Created by ramil on 28.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var searching = ""
    
    let cities = ["Tallinn", "Tartu", "Pärnu", "Narva"]
    
    var body: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                List {
                    ForEach(results, id: \.self) { city in
                        NavigationLink(destination: Text(city)) {
                            Text(city)
                        }
                    }
                }
                .searchable(text: $searching)
                .navigationTitle("Estonia cities")
            } else {
                // Fallback on earlier versions
            }
        }
    }
     
    var results: [String] {
        if searching.isEmpty {
            return cities
        } else {
            return cities.filter { $0.contains(searching) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
