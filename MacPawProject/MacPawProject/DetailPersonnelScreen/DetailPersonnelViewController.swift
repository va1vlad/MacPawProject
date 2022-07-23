//
//  DetailViewController.swift
//  MacPawProject
//
//  Created by user on 20.07.2022.
//

import UIKit

class DetailPersonnelViewController: UIViewController, DetailViewProtocol {
    
    //MARK: - Outlets
    @IBOutlet weak var detailTableView: UITableView!
    
    //MARK: - Properties
    var presenter: PresenterDetailInterfaceProtocol?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        presenter?.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Methods
    func updateList() {
        detailTableView.reloadData()
    }
    
    private func setupTableView() {
        let lossesEqupmentCell = UINib(nibName: "LosesAttributeCell",
                                       bundle: nil)
        self.detailTableView.register(lossesEqupmentCell,
                                forCellReuseIdentifier: "LosesAttributeCell")

        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
}

//MARK: - UITableViewDataSource
extension DetailPersonnelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.attributes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LosesAttributeCell", for: indexPath) as? LosesAttributeCell else {
            return UITableViewCell()
        }
        
        guard let attribute = presenter?.attributes[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.setup(with: attribute)
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension DetailPersonnelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
