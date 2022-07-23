//
//  LossesPersonnelViewPresenter.swift
//  MacPawProject
//
//  Created by user on 17.07.2022.
//

import Foundation

class LossesPresenter: LossesPresenterInterface {
    
    //MARK: - Properties
    weak var view: LossesView?
    
    private var service: LosesServiceInterface

    var дossesPersonnelModel: [LossesPersonnel] = []
    var lossesEquipmentModel: [LossesEquipment] = []
    
    private(set) var state: LossesState = .personal
    
    //MARK: - init
    init(service: LosesServiceInterface) {
        self.service = service
    }
    
    //MARK: - Methods
    func setState(by index: Int) {
        state = LossesState(rawValue: index) ?? .personal
        view?.uptadeList()
    }

    func loadData() {
        service.loadLossesPersonnel { [weak self] loses in
            self?.дossesPersonnelModel = loses
            DispatchQueue.main.async {
                self?.view?.uptadeList()
            }
        }
        
        service.loadLossesEquipment { [weak self] loses in
            self?.lossesEquipmentModel = loses
            DispatchQueue.main.async {
                self?.view?.uptadeList()
            }
        }
    }
}
