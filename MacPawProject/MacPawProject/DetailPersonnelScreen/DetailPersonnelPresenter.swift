//
//  DetailPresenter.swift
//  MacPawProject
//
//  Created by user on 20.07.2022.
//

import Foundation

class DetailPersonnelPresenter: PresenterDetailInterfaceProtocol {
    
    weak var view: DetailViewProtocol?
    private var attributeBuilder: DetailAttributesBuilder
    
    var attributes: [LosesAttributeModel] = []
    
    private var persModel: LossesPersonnel
    
    init(builoder: DetailAttributesBuilder, model: LossesPersonnel) {
        attributeBuilder = builoder
        persModel = model
    }
    
    func loadData() {
        setupAttributes()
        view?.updateList()
    }
    
    private func setupAttributes() {
        attributes = attributeBuilder.build(model: persModel)
    }
}
