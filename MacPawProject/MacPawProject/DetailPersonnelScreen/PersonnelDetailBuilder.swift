//
//  DetailBuilder.swift
//  MacPawProject
//
//  Created by user on 20.07.2022.
//

import Foundation
import UIKit

class PersonnelDetailBuilder {
    static func createDetailVC(model: LossesPersonnel) -> DetailPersonnelViewController? {
        guard let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as?
                DetailPersonnelViewController else {
            return nil
        }
        
        let detailPresenter = DetailPersonnelPresenter(builoder: DetailAttributesBuilder(), model: model)
        
        detailViewController.presenter = detailPresenter
        detailPresenter.view = detailViewController
        
        return detailViewController
    }
}

