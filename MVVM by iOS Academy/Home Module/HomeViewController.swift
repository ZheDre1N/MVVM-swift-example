//
//  HomeViewController.swift
//  MVVM by iOS Academy
//
//  Created by Eugene Dudkin on 18.02.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: HomeViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HomeViewModel()
        title = "MVVM example"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // It is assemblyBuilder with router
        let detailVC = DetailViewController()
        viewModel.selectRow(atIndexPath: indexPath)
        let detailViewModel = viewModel.viewModelForSelectedRow()
        detailVC.viewModel = detailViewModel
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let homeCellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.textLabel?.text = homeCellViewModel.ticker
        cell.detailTextLabel?.text = String(homeCellViewModel.price)
        return cell
    }
}
