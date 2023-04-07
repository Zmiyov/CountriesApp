//
//  CountryDetailViewModel.swift
//  CountriesApp
//
//  Created by Vladimir Pisarenko on 06.04.2023.
//

import Foundation
import Apollo
import CountriesAPI

class CountryDetailViewModel: ObservableObject {
    @Published private var country: GetCountryInfoQuery.Data.Country?
    
    var name: String {
        country?.name ?? ""
    }
    
    var capital: String {
        country?.capital ?? ""
    }
    
    var states: [StateViewModel] {
        return country?.states.map(StateViewModel.init) ?? []
    }
    
    func getCountryDetailsByCode(code: String) {
        Network.shared.apollo.fetch(query: GetCountryInfoQuery(code: code)) { result in
            switch result {
                
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    self.country = graphQLResult.data?.country
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct StateViewModel: Identifiable {
    
    fileprivate let state: GetCountryInfoQuery.Data.Country.State
    
    let id = UUID()
    
    var name: String {
        state.name
    }
}
