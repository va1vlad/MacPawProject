//
//  DetailEquipmenViewController.swift
//  MacPawProject
//
//  Created by user on 22.07.2022.
//

import UIKit

class DetailEquipmenViewController: UIViewController, DetailEquipmenViewProtocol {
    
    //MARK: - Outlets
    @IBOutlet weak var equipmentTableView: UITableView!
    
    //MARK: - Properties
    var presenter: DetailEquipmenProtocol?
 
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
        equipmentTableView.reloadData()
    }
    
    private func setupTableView() {
        let lossesEqupmentCell = UINib(nibName: "LosesAttributeCell",
                                       bundle: nil)
        self.equipmentTableView.register(lossesEqupmentCell,
                                         forCellReuseIdentifier: "LosesAttributeCell")
        
        equipmentTableView.dataSource = self
        equipmentTableView.delegate = self
    }
}

//MARK: - UITableViewDataSource
extension DetailEquipmenViewController: UITableViewDataSource {
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
extension DetailEquipmenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
