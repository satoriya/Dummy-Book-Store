//
//  HomeViewModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import Foundation

protocol HomeProtocol {
    var bookDataBinding: ((Book?) -> ())? { get set }
}

class HomeViewModel: HomeProtocol {
    private let url = "http://localhost:3000/home#"
    private var apiServiceProtocol: APIServiceProtocol?
    
    var bookDataBinding: ((Book?) -> ())?

    init(apiServiceProtocol: APIServiceProtocol) {
        self.apiServiceProtocol = apiServiceProtocol
        fetchBookData()
    }
    
    func fetchBookData() {
        self.apiServiceProtocol?.callApi(with: self.url, model: Book.self, completion: { result in
            switch result {
            case .success(let book):
                self.bookDataBinding?(book)
                print("Book Data: \(book)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        
    }
    
    
}
