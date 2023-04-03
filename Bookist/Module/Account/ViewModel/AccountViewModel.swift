//
//  AccountViewModel.swift
//  Bookist
//
//  Created by Phincon on 03/04/23.
//

import Foundation

protocol AccountViewProtocol {
    var urlString: String { get }
    var bindAccountData: ((Account?) -> ())? { get set }
    func fetchAccountData()
}

class AccountViewModel: AccountViewProtocol {
    private var apiService: ApiServiceProtocol?
    var urlString: String
    
    var bindAccountData: ((Account?) -> ())?
    
    init(urlString: String, apiService: ApiServiceProtocol){
        self.urlString = urlString
        self.apiService = apiService
        if let url = URL(string: urlString){
            self.apiService?.get(url: url)
        }
        fetchAccountData()
    }
    func fetchAccountData() {
        self.apiService?.callApi(model: Account.self, completion: { response in
            switch response {
            case .success(let accountDatas):
                self.bindAccountData?(accountDatas)
            case .failure(_):
                self.bindAccountData?(nil)
            }
        })
    }
    
}
