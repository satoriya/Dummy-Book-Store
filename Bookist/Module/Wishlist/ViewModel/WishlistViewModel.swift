//
//  WishlistViewModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import Foundation

protocol WishlistViewModelProtocol {
    var urlString : String {get}
    var bindWishlistData : ((WishlistModel?)->())? {get set}
    func fetchWishlist()
}
class WishlistViewModel: WishlistViewModelProtocol {
    
    private var apiService: ApiServiceWishlistProtocol
    var urlString: String
    var data : WishlistModel?
    var bindWishlistData: ((WishlistModel?) -> ())?

    init(urlString : String, apiService: ApiServiceWishlistProtocol) {
        self.urlString = urlString
        self.apiService = apiService

        if let url = URL(string: urlString) {
            self.apiService.get(url: url) }
        fetchWishlist()
    }
    func fetchWishlist(){
        self.apiService.callApi(model: WishlistModel.self, completion: { response in
            print("response : ", response)
            switch response {
            case .success(let success):
                self.bindWishlistData?(success)
            case .failure(_):
                self.bindWishlistData?(nil)    }
            self.bindWishlistData?(nil)
        })
    }
}

