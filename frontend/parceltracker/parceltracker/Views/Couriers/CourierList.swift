//
//  CourierList.swift
//  parceltracker
//
//  Created by Gintare Statkute on 2020-06-15.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct CourierList: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    var sortedCouriers = courierData.sorted(by: { $0.name < $1.name })
    var body: some View {
        VStack {
            // Search Bar
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")

                    TextField("search", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        print("onCommit")
                    }).foregroundColor(.primary)

                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)

                if showCancelButton  {
                    Button("Cancel") {
                            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                            self.searchText = ""
                            self.showCancelButton = false
                    }
                    .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
            
            // Courier List
            List {
                // the foreach below uses alphabetically sorted list of couriers
                ForEach(sortedCouriers.filter{$0.name.hasPrefix(searchText) || searchText == ""}) { courier in // TODO might want to do all lowercase comparison
                    CourierRow(courier: courier)
                }
            }
        }
    }
}

struct CourierList_Previews: PreviewProvider {
    static var previews: some View {
        CourierList()
    }
}

// source for the searchbar: https://stackoverflow.com/questions/56490963/how-to-display-a-search-bar-with-swiftui
extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
