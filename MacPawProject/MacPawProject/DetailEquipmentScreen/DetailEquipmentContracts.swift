//
//  DetailEquipmentContracts.swift
//  MacPawProject
//
//  Created by user on 22.07.2022.
//

import Foundation

protocol DetailEquipmenViewProtocol: AnyObject {
    func updateList()
}

protocol DetailEquipmenProtocol {
    var attributes: [LosesAttributeModel] { get }
    
    func loadData()
}


