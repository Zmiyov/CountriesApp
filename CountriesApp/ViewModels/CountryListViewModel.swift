//
//  CountryListViewModel.swift
//  CountriesApp
//
//  Created by Vladimir Pisarenko on 06.04.2023.
//

import Foundation
import Apollo
import CountriesAPI

class CountryListViewModel: ObservableObject {
    
    @Published var countries: [CountryViewModel] = []
    
    func getAllCountries() {
        Network.shared.apollo.fetch(query: GetAllQueriesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let countries = graphQLResult.data?.countries {
                    DispatchQueue.main.async {
                        self.countries = countries.map(CountryViewModel.init)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

struct CountryViewModel {
    fileprivate let country: GetAllQueriesQuery.Data.Country
    
    var code: String {
        country.code
    }
    
    var name: String {
        country.name
    }
    
    var emoji: String {
        country.emoji
    }
}
