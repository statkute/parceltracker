//
//  ScopeFilter.swift
//  Parceltracker
//
//  Created by Gintare Statkute on 2020-07-03.
//

import SwiftUI

struct ParcelListFilter: View {
    @ObservedObject var selectedParcelFilter: SelectedParcelFilter
    @State var filter : Bool = true
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 210, height: 35)
                .cornerRadius(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : UIColor.secondaryLabel)).opacity(colorScheme == .dark ? 0.9 : 0.3)
            
            HStack {
                FilterScope(selectedParcelFilter: selectedParcelFilter, filterName: "Upcoming", activeOnUpcomingFilterValue: ParcelFilter.Upcoming)
                FilterScope(selectedParcelFilter: selectedParcelFilter, filterName: "Past", activeOnUpcomingFilterValue: ParcelFilter.Past)
            }
        }
        .frame(width: 210.0, height: 35.0)
    }
}

struct ScopeFilter_Previews: PreviewProvider {
    static var previews: some View {
        ParcelListFilter(selectedParcelFilter: SelectedParcelFilter())
            .environment(\.colorScheme, .light)
    }
}

struct FilterScope: View {
    @ObservedObject var selectedParcelFilter: SelectedParcelFilter
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var filterName: String
    var activeOnUpcomingFilterValue: ParcelFilter
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: 100, height: 30)
                .foregroundColor(Color(UIColor.white).opacity(self.activeOnUpcomingFilterValue == self.selectedParcelFilter.filter ? (colorScheme == .dark ? 0.2 : 0.8) : 0))
                .cornerRadius(1.0)
            
            Text(self.filterName)
                .font(.footnote)
        }
        .padding(self.selectedParcelFilter.filter == ParcelFilter.Upcoming ? .leading : .trailing, 2.5)
        .frame(width: 100.0, height: 30.0)
        .onTapGesture {
            if(self.activeOnUpcomingFilterValue != self.selectedParcelFilter.filter){
                switch self.selectedParcelFilter.filter {
                case(ParcelFilter.Upcoming):
                    self.selectedParcelFilter.filter = ParcelFilter.Past
                case(ParcelFilter.Past):
                    self.selectedParcelFilter.filter = ParcelFilter.Upcoming
                }
            }
        }
    }
}
    
