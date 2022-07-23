//
//  LossesPersonnelContrcats.swift
//  MacPawProject
//
//  Created by user on 17.07.2022.
//

import Foundation

enum LossesState: Int {
    case personal = 0
    case equipment = 1
}

protocol LossesView: AnyObject {
    func uptadeList()
    func setState(_ state: LossesState)
}

protocol LossesPresenterInterface {
    var дossesPersonnelModel: [LossesPersonnel] { get }
    var lossesEquipmentModel: [LossesEquipment] { get }
    var state: LossesState { get }
    
    func loadData()
    func setState(by index: Int)
}

