//
//  DetailContrcats.swift
//  MacPawProject
//
//  Created by user on 20.07.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func updateList()
}

protocol PresenterDetailInterfaceProtocol {
    var attributes: [LosesAttributeModel] { get }
    
    func loadData()
}
