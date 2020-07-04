//
//  ContentView.swift
//  parceltracker
//
//  Created by Gintare Statkute on 2020-06-14.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            ParcelsHomeTab()
                .tabItem {
                    VStack {
                        Image(systemName: "archivebox")
                        Text("Parcels")
                    }
                }
                .tag(0)
            Text("Second View")
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
