//
//  DetailViewController.swift
//  MVVM by iOS Academy
//
//  Created by Eugene Dudkin on 19.02.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var viewModel: DetailViewModelProtocol?
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Share Detail VC"
        guard let viewModel = viewModel else { return }
        tickerLabel.text = "Угадай какой тикер"
        descriptionLabel.text = viewModel.description
        
        viewModel.ticker.bind { [ unowned self] in
            guard let value = $0 else { return }
            self.tickerLabel.text = value
        }
        
        delay(delay: 5) { [ unowned self ] in
            self.viewModel?.ticker.value = "ticker from data binding"
        }
        
    }
    
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }
    
    
    
}
