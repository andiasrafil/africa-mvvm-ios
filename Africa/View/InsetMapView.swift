//
//  InsetMapView.swift
//  Africa
//
//  Created by Accounting on 07/07/21.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(NavigationLink(
                        destination: MapView(),
                        label: {
                            HStack {
                                Image(systemName: "mappin.cirle")
                                    .foregroundColor(Color.white)
                                    .imageScale(.large)
                                
                                Text("Locations")
                                    .foregroundColor(.accentColor)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 14)
                            .background(Color.black)
                            .opacity(0.4)
                            .cornerRadius(8.0)
                        })
                        .padding(12)
                     , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
