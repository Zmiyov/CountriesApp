//
//  CountryDetailView.swift
//  CountriesApp
//
//  Created by Vladimir Pisarenko on 06.04.2023.
//

import SwiftUI
import CountriesAPI

struct CountryDetailView: View {
    
    let country: CountryViewModel
    @StateObject private var countryDetailViewModel = CountryDetailViewModel()
    
    var body: some View {
        VStack {
            Text(countryDetailViewModel.name)
            Text(countryDetailViewModel.capital)
            List(countryDetailViewModel.states , id: \.id) { state in
                Text(state.name)
            }
        }.onAppear {
            countryDetailViewModel.getCountryDetailsByCode(code: country.code)
        }
    }
}
