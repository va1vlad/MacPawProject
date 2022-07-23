//
//  NetvorkService.swift
//  MacPawProject
//
//  Created by user on 18.07.2022.
//

import Foundation

protocol LosesServiceInterface {
    func loadLossesPersonnel(handler: (([LossesPersonnel]) -> Void)?)
    func loadLossesEquipment(handler: (([LossesEquipment]) -> Void)?)
}

class LosesService: LosesServiceInterface {
        
    func loadLossesPersonnel(handler: (([LossesPersonnel]) -> Void)?) {
        
        if let url = URL(string: "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodeData = try JSONDecoder().decode([LossesPersonnel].self, from: data)
                        handler?(decodeData)
                        
                    } catch let error {
                        handler?([])
                        print("ERROR🔥 \(error)")
                    }
                }
            }.resume()
        }
    }
    
    func loadLossesEquipment(handler: (([LossesEquipment]) -> Void)?) {
        
        if let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let newData = String(data: data, encoding: .utf8)?.replacingOccurrences(of: "NaN", with: "0").data(using: .utf8)
                        let decodeData = try JSONDecoder().decode([LossesEquipment].self, from: newData!)
                        handler?(decodeData)
                        
                    } catch let error {
                        handler?([])
                        print("ERROR🔥 \(error)")
                    }
                }
            }.resume()
        }
    }
}
