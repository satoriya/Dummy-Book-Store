//
//  BuyPageViewModel.swift
//  Bookist
//
//  Created by Phincon on 03/04/23.
//

import Foundation

protocol BuyPageProtocol{
    var url : String {get set}
    var bindBuyPage : ((BuyPageModel?)->())? { get set }
    func fetchBuyPage()
}

class BuyPageViewModel: BuyPageProtocol{
    var bindBuyPage: ((BuyPageModel?) -> ())?
    var url: String = ""
    private var apiService : ApiServiceProtocol?
    var delegate : BuyPageProtocol?
    var data : BuyPageModel?
    
    
    init(urlSting : String, apiService: ApiServiceProtocol) {
        self.url = urlSting
        self.apiService = apiService as? ApiService
        if let url = URL(string:  urlSting){
            self.apiService?.get(url: url )
        }
    }
    
    func fetchBuyPage() {
        self.apiService?.callApi(model: BuyPageModel?.self, completion: { response in
           print("response")
            switch response{
            case .success(let success):
                self.bindBuyPage?(success)
            case .failure(let error):
                print(error.localizedDescription)
                self.bindBuyPage?(nil)
            }
        })
    }
    
    
}
