//
//  PurchasedViewModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import Foundation

protocol ApiServiceItemsProtocol {
    var urlString: String? { get set }
    var bindListData: ((PurchasedModel?) -> ())? { get set }
    func fetchItem()
}

class PurchasedViewModel: ApiServiceItemsProtocol {
    private var apiService: PurchasedApiService?
    var data: PurchasedModel?
    var urlString: String?
    var bindListData: ((PurchasedModel?) -> Void)?
    var purchasedModel: PurchasedModel?
    init(urlString: String?, apiService: PurchasedApiService?) {
        self.urlString = urlString
        self.apiService = apiService
        if let url = URL(string: urlString ?? "") {
            self.apiService?.get(url: url)
        }
        fetchItem()
    }
    
    func fetchItem() {
        self.apiService?.callApi(model: PurchasedModel?.self, completion: {
            response in
            switch response {
            case .success(let success):
                self.bindListData?(success)
                print("success response")
            case .failure(_):
                self.bindListData?(nil)
                print("failed response")
                
            }
        })
    }
}


