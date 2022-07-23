//
//  DetailEquipmentPresenter.swift
//  MacPawProject
//
//  Created by user on 22.07.2022.
//

import Foundation

class DetailEquipmentPresenter: DetailEquipmenProtocol {
    
    weak var view: DetailEquipmenViewProtocol?
    private var attributeBuilder: EquipmentAttributesBuilder
    
    var attributes: [LosesAttributeModel] = []
    
    private var equipmentModel: LossesEquipment
    
    init(builder: EquipmentAttributesBuilder, model: LossesEquipment) {
        attributeBuilder = builder
        equipmentModel = model
    }
    
    func loadData() {
        setupAttributes()
        view?.updateList()
    }
    
    private func setupAttributes() {
        attributes = attributeBuilder.build(model: equipmentModel)
    }
}
