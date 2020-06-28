//
//  CourierRow.swift
//  parceltracker
//
//  Created by Gintare Statkute on 2020-06-15.
//  Copyright © 2020 Bourn32. All rights reserved.
//

import SwiftUI

struct CourierRow: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var selectedCourier: SelectedCourier
    var courier: Courier
    var body: some View {
        HStack {
            courier.image.resizable().scaledToFit().frame(width: 30, height: 30).padding(/*@START_MENU_TOKEN@*/.trailing, 5.0/*@END_MENU_TOKEN@*/)
            Text(courier.name)
            Spacer()
            if(selectedCourier.courierId == courier.id){
                Image(systemName: "checkmark").foregroundColor(.accentColor)
            }
        }
        .contentShape(Rectangle())  // ensures that Spacer() area is also clickeable as it isn't by default
        .onTapGesture {
            self.selectedCourier.courierId = self.courier.id;
            self.selectedCourier.courierName = self.courier.name;
            self.mode.wrappedValue.dismiss();
            
        } // goes back to the previous view
    }
}

struct CourierRow_Previews: PreviewProvider {
    static var previews: some View {
        CourierRow(selectedCourier: SelectedCourier(), courier: courierData[3])
    }
}
