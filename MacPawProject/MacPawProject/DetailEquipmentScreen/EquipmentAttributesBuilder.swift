//
//  EquipmentAttributesBuilder.swift
//  MacPawProject
//
//  Created by user on 22.07.2022.
//

import Foundation

class EquipmentAttributesBuilder {
    func build(model: LossesEquipment) -> [LosesAttributeModel] {
        let attribute: [LosesAttributeModel] = [
            
            LosesAttributeModel(
                placeholder: "Date",
                value: model.date
            ),
            LosesAttributeModel(
                placeholder: "Day",
                value: model.day?.description ?? "0"
            ),
            LosesAttributeModel(
                placeholder: "Aircraft",
                value: model.aircraft.description
            ),
            LosesAttributeModel(
                placeholder: "Helicopter",
                value: model.helicopter.description
            ),
            LosesAttributeModel(
                placeholder: "Tank",
                value: model.tank.description
            ),
            LosesAttributeModel(
                placeholder: "Armored Personnel Carrier",
                value: model.apc.description
            ),
            LosesAttributeModel(
                placeholder: "Field Artillery",
                value: model.fieldArtillery.description
            ),
            LosesAttributeModel(
                placeholder: "Multiple Rocket Launcher",
                value: model.mrl.description
            ),
            LosesAttributeModel(
                placeholder: "Drone",
                value: model.drone.description
            ),
            LosesAttributeModel(
                placeholder: "Naval Ship",
                value: model.navalShip.description
            ),
            LosesAttributeModel(
                placeholder: "Anti-aircraft Warfare",
                value: model.antiAircraftWarfare.description
            ),
            LosesAttributeModel(
                placeholder: "Special Equipment",
                value: model.specialEquipment?.description ?? "0"
            ),
            LosesAttributeModel(
                placeholder: "Cruise Missiles",
                value: model.cruiseMissiles?.description ?? "0"
            ),
            LosesAttributeModel(
                placeholder: "Vehicles and Fuel Tanks",
                value: model.vehiclesAndFuelTanks?.description ?? "0"
            ),
            LosesAttributeModel(
                placeholder: "Direction of Greatest Losses",
                value: model.greatestLossesDirection ?? "0"
            ),
            
            
            LosesAttributeModel(
                placeholder: "Military Auto",
                value: model.militaryAuto?.description ?? "0"
            ),
            LosesAttributeModel(
                placeholder: "Fuel Tank",
                value: model.fuelTank?.description ?? "0"
            ),
            LosesAttributeModel(
                placeholder: "Mobile SRBM System",
                value: model.mobileSRBMSystem?.description ?? "0"
            ),
            
        ]
        
        return attribute
    }
}
