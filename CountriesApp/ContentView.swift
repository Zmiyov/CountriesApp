//
//  ContentView.swift
//  CountriesApp
//
//  Created by Vladimir Pisarenko on 06.04.2023.
//

import SwiftUI
import CountriesAPI

struct ContentView: View {
    
    @StateObject private var countryListVM = CountryListViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(countryListVM.countries, id: \.code) { country in
                    NavigationLink {
                        CountryDetailView(country: country)
                    } label: {
                        HStack {
                            Text(country.emoji)
                            Text(country.name)
                        }
                    }

                }.listStyle(PlainListStyle())
                
            }.onAppear {
                countryListVM.getAllCountries()
            }
            .navigationTitle("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
