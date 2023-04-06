//
//  RomanceViewModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import Foundation

protocol GenreViewModelProtocol {
    var urlString: String {get}
    var bindData: ((GenreResponse?) -> ())? { get set}
    func fetchData()
}

class GenreViewModel: GenreViewModelProtocol {
    
    private var apiService: ApiServiceGenreProtocol?
    var urlString: String
    var bindData: (((GenreResponse?)) -> ())?
    
    init(urlString: String, apiService: ApiServiceGenreProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        
        fetchData()
    }
    
    func fetchData() {
        self.apiService?.callApi(model: GenreResponse.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindData?(success)
            case .failure(let error):
                print(error.localizedDescription)
                self.bindData?(nil)
            }
        })
        
    }
    
    
}
