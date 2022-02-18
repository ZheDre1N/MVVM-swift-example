//
//  HomeCellViewModel.swift
//  MVVM by iOS Academy
//
//  Created by Eugene Dudkin on 18.02.2022.
//

import Foundation

protocol HomeCellViewModelProtocol {
    init(share: Share)
    var ticker: String { get }
    var price: Int { get }
}

class HomeCellViewModel: HomeCellViewModelProtocol {
    
    private var share: Share!
    
    var ticker: String {
        return share.ticker + " share"
    }
    
    var price: Int {
        return share.price
    }
    
    required init(share: Share) {
        self.share = share
    }
}
