//
//  CityListView.swift
//  GezYap
//
//  Created by Ömer Faruk Kılıçaslan on 3.06.2023.
//

import SwiftUI

struct CityListView: View {
    @ObservedObject var viewModel = CityViewModel()
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    ForEach(Array(viewModel.allCityData.enumerated()), id: \.element.name) { index, city in
                        NavigationLink(destination: CityDetailsView(city: city)) {
                            CityRow(city: city)
                                .environmentObject(viewModel)
                        }
                    }
                }
                .navigationTitle("Tüm Şehirler")
            }
        }
    }
}

