//
//  DetailEquipmentBuilder.swift
//  MacPawProject
//
//  Created by user on 22.07.2022.
//

import Foundation
import UIKit

class EquipmentDetailBuilder {
    static func createEquipmentDetailVC(model: LossesEquipment) -> DetailEquipmenViewController? {
        guard let detailEquipmenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailEquipmenViewController") as? DetailEquipmenViewController else {
            return nil
        }
        
   let equipmentDetailPresenter = DetailEquipmentPresenter(builder: EquipmentAttributesBuilder(), model: model)
        
        detailEquipmenVC.presenter = equipmentDetailPresenter
        equipmentDetailPresenter.view = detailEquipmenVC
        
        return detailEquipmenVC
    }
}
