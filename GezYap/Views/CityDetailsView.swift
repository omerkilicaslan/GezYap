//
//  CityDetails.swift
//  GezYap
//
//  Created by Ömer Faruk Kılıçaslan on 3.06.2023.
//

import SwiftUI

import SwiftUI

struct CityDetailsView: View {
    let city: City
    
    var body: some View {
        VStack {
            Text(city.name)
                .font(.title)
                .padding()
            
            Text("En Meşhur Aktiviteler:")
                .font(.headline)
            
            List(city.activities, id: \.self) { activity in
                Text(activity)
            }
            
            Text("En Meşhur Yemekler:")
                .font(.headline)
            
            List(city.foods, id: \.self) { food in
                Text(food)
            }
            
            Spacer()
        }
        .navigationTitle("Detaylar")
    }
}

struct CityDetails_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailsView(city:  City(name: "İstanbul", activities: ["Boğaz turu", "Ayasofya ziyareti"], foods: ["İskender", "Baklava"], isTraveled: false))
    }
}
