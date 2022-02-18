//
//  HomeViewModel.swift
//  MVVM by iOS Academy
//
//  Created by Eugene Dudkin on 18.02.2022.
//

import Foundation

protocol HomeViewModelProtocol {
    var numberOfRows: Int { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeCellViewModelProtocol
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol?
    func selectRow(atIndexPath indexPath: IndexPath)
}

class HomeViewModel: HomeViewModelProtocol {

    private var selectedIndexPath: IndexPath?
    
    private var shareStorage = [
        Share(ticker: "AMZN", price: 3500, category: "Commercial"),
        Share(ticker: "CRM", price: 200, category: "Fintech"),
        Share(ticker: "TROW", price: 100, category: "Fintech")
    ]
    
    var numberOfRows: Int {
        return shareStorage.count
    }

    func cellViewModel(forIndexPath indexPath: IndexPath) -> HomeCellViewModelProtocol {
        let share = shareStorage[indexPath.row]
        return HomeCellViewModel(share: share)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(share: shareStorage[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
