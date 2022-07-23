//
//  Builder.swift
//  MacPawProject
//
//  Created by user on 17.07.2022.
//

import Foundation
import UIKit

class Builder {
    static func createLossesVC() -> LossesViewController? {
        guard let lossesVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? LossesViewController
        else {
            return nil
        }
        let lossesPresenter = LossesPresenter(service: LosesService())
        lossesVC.presenter = lossesPresenter 
        lossesPresenter.view = lossesVC
        return lossesVC
    }
}

