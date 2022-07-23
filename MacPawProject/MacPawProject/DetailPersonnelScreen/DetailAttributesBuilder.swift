//
//  DetailAttributesBuilder.swift
//  MacPawProject
//
//  Created by user on 21.07.2022.
//

import Foundation

class DetailAttributesBuilder {
    func build(model: LossesPersonnel) -> [LosesAttributeModel] {
        let attributes: [LosesAttributeModel] = [
            LosesAttributeModel(
                placeholder: "Date",
                value: model.date
            ),
            LosesAttributeModel(
                placeholder: "Day",
                value: model.day.description
            ),
            LosesAttributeModel(
                placeholder: "Dead",
                value: "\(model.personnelPrefix) \(model.personnel)"
            ),
            LosesAttributeModel(
                placeholder: "Prisoner",
                value: model.prisonerOfWar?.description ?? "0"
            ),
        ]
        
        return attributes
    }
}
