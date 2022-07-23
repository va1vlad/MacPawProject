//
//  ViewController.swift
//  MacPawProject
//
//  Created by user on 17.07.2022.
//

import UIKit

class LossesViewController: UIViewController, LossesView {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showScreenSegmentedControl: UISegmentedControl!
    
    //MARK: - Properties
    var presenter: LossesPresenterInterface?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        presenter?.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
  
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Methods
    func uptadeList() {
        tableView.reloadData()
    }
    
    func setState(_ state: LossesState) {
        switch state {
        case .personal:
            view.backgroundColor = .red
            showScreenSegmentedControl.backgroundColor = .red
        case .equipment:
            view.backgroundColor = .green
            showScreenSegmentedControl.backgroundColor = .green
        }
    }
    
    private func setupTableView() {
        let customCell = UINib(nibName: "LossesPersonnelCell",
                               bundle: nil)
        self.tableView.register(customCell,
                                forCellReuseIdentifier: "LossesPersonnelCell")
        
        let lossesEqupmentCell = UINib(nibName: "LossesEqupmentCell",
                                       bundle: nil)
        self.tableView.register(lossesEqupmentCell,
                                forCellReuseIdentifier: "LossesEqupmentCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Actions
    @IBAction func segmentedControlAction(_ sender: Any) {
        presenter?.setState(by: showScreenSegmentedControl.selectedSegmentIndex)
    }
}

//MARK: - UITableViewDataSource
extension LossesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let state = presenter?.state else { return 0 }
        
        switch state {
        case .personal:
            return presenter?.дossesPersonnelModel.count ?? 0
        case .equipment:
            return presenter?.lossesEquipmentModel.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let state = presenter?.state else { return UITableViewCell() }
        
        switch state {
        case .personal:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LossesPersonnelCell") as? LossesPersonnelCell,
                  let model = presenter?.дossesPersonnelModel[indexPath.row] else {
                
                return UITableViewCell()
            }
            
            cell.view.layer.borderWidth = 2
            cell.view.layer.borderColor = UIColor.black.cgColor
            
            cell.placeholderLabel.text = "Day \(model.day)"
            cell.valueLabel.text = "Personnel🧟‍♂️ \(model.personnel)"
            
            return cell
            
        case .equipment:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LossesEqupmentCell") as? LossesEqupmentCell,
                  let model = presenter?.lossesEquipmentModel[indexPath.row] else {
                
                return UITableViewCell()
            }
            
            cell.view.layer.borderWidth = 2
            cell.view.layer.borderColor = UIColor.black.cgColor
            
            cell.placeholderLabel.text = model.date
            
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension LossesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let state = presenter?.state else { return }
        
        switch state {
        case .personal:
            guard let personnelModel = presenter?.дossesPersonnelModel[indexPath.row] else { return }
            
            guard let personnelDetailsVC = PersonnelDetailBuilder.createDetailVC(model: personnelModel) else {
                return
            }
            
            self.navigationController?.pushViewController(personnelDetailsVC, animated: true)
            
        case .equipment:
            guard let equipmentModel = presenter?.lossesEquipmentModel[indexPath.row] else { return }
            
            guard let equipmentDetailsVC = EquipmentDetailBuilder.createEquipmentDetailVC(model: equipmentModel) else {
                return
            }
            
            self.navigationController?.pushViewController(equipmentDetailsVC, animated: true)
        }
    }
}

