//
//  CityRow.swift
//  GezYap
//
//  Created by Ömer Faruk Kılıçaslan on 3.06.2023.
//

import SwiftUI

struct CityRow: View {
    @State var city: City
    @EnvironmentObject var viewModel: CityViewModel
    
    var body: some View {
        
        VStack(spacing: 4){
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .frame(height: 1)
                .padding(.trailing,20)
                .padding(.leading,20)
            HStack {
                Text(city.name)
                    .font(.system(size: 22, weight: .regular))
                    .foregroundColor(city.isTraveled ? .green : .black)
                    .padding(.leading, 40)
                Spacer()
                Image(systemName: city.isTraveled ? "star.circle.fill" : "circle")
                    .resizable()
                    .foregroundColor(
                        withAnimation {
                            city.isTraveled ? .green : .red
                        }
                    )
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 40)
                    .onTapGesture {
                        city.isTraveled.toggle()
                        
                        if let index = viewModel.allCityData.firstIndex(where: { $0.name == city.name }) {
                            viewModel.allCityData.remove(at: index)
                            viewModel.allCityData.append(city)
                        }
                    }
            }
            .padding(.vertical, 8)
            
        }
          
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0){
            CityRow(city: City(name: "Paris", activities: ["Eiffel Kulesi", "Louvre Müzesi"], foods: ["Croissant", "Escargot"], isTraveled: true))
            CityRow(city: City(name: "Paris", activities: ["Eiffel Kulesi", "Louvre Müzesi"], foods: ["Croissant", "Escargot"], isTraveled: true))
            CityRow(city: City(name: "Paris", activities: ["Eiffel Kulesi", "Louvre Müzesi"], foods: ["Croissant", "Escargot"], isTraveled: true))
            CityRow(city: City(name: "Paris", activities: ["Eiffel Kulesi", "Louvre Müzesi"], foods: ["Croissant", "Escargot"], isTraveled: true))
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
