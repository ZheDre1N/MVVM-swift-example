//
//  DetailViewModel.swift
//  MVVM by iOS Academy
//
//  Created by Eugene Dudkin on 19.02.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    var description: String { get }
    var ticker: Box<String?> { get }
}

class DetailViewModel: DetailViewModelProtocol {
    
    private var share: Share
    var ticker: Box<String?> = Box(nil)
    
    var description: String {
        return "Это акция с тикером \(share.ticker), сейчас она стоит: \(share.price). Акция из категории \(share.category)"
    }
    
    required init(share: Share) {
        self.share = share
    }

}
