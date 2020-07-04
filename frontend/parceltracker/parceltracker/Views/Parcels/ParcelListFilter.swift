//
//  ScopeFilter.swift
//  Parceltracker
//
//  Created by Gintare Statkute on 2020-07-03.
//

import SwiftUI


var filterScopeWidth = CGFloat(210.0)
var filterScopeHeight = CGFloat(35.0)
var filterScopeCapsuleDarkModeOpacity = 0.9
var filterScopeCapsuleLightModeOpacity = 0.3
var filterScopeButtonWidth = CGFloat(100.0)
var filterScopeButtonHeight = CGFloat(30.0)
var filterScopeButtonSidePadding = (filterScopeHeight - filterScopeButtonHeight) / CGFloat(2.0)
var filterScopeCapsuleRadius = CGFloat(1.0)
var filterScopeButtonDarkModeOpacity = 0.2
var filterScopeButtonLightModeOpacity = 0.8
var filterScopeButtonInvisibleOpacity = 0.0


struct ParcelListFilter: View {
    @ObservedObject var selectedParcelFilter: SelectedParcelFilter
    @State var filter : Bool = true
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(width: filterScopeWidth, height: filterScopeHeight)
                .cornerRadius(filterScopeCapsuleRadius)
                .foregroundColor(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : UIColor.secondaryLabel)).opacity(colorScheme == .dark ? filterScopeCapsuleDarkModeOpacity : filterScopeCapsuleLightModeOpacity)
            
            HStack {
                FilterScope(selectedParcelFilter: selectedParcelFilter, filterName: ParcelFilter.Upcoming.rawValue, activeOnUpcomingFilterValue: ParcelFilter.Upcoming)
                FilterScope(selectedParcelFilter: selectedParcelFilter, filterName: ParcelFilter.Past.rawValue, activeOnUpcomingFilterValue: ParcelFilter.Past)
            }
        }
        .frame(width: filterScopeWidth, height: filterScopeHeight)
    }
}

struct ScopeFilter_Previews: PreviewProvider {
    static var previews: some View {
        ParcelListFilter(selectedParcelFilter: SelectedParcelFilter())
            .environment(\.colorScheme, .dark)
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
                .frame(width: filterScopeButtonWidth, height: filterScopeButtonHeight)
                .foregroundColor(Color(UIColor.white).opacity(self.activeOnUpcomingFilterValue == self.selectedParcelFilter.filter ? (colorScheme == .dark ? filterScopeButtonDarkModeOpacity : filterScopeButtonLightModeOpacity) : filterScopeButtonInvisibleOpacity))
                .cornerRadius(filterScopeCapsuleRadius)
            
            Text(self.filterName)
                .font(.footnote)
        }
        .padding(self.selectedParcelFilter.filter == ParcelFilter.Upcoming ? .leading : .trailing, filterScopeButtonSidePadding)
        .frame(width: filterScopeButtonWidth, height: filterScopeButtonHeight)
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
    
