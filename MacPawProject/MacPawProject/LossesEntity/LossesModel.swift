//
//  LossesManager.swift
//  MacPawProject
//
//  Created by user on 18.07.2022.
//

import Foundation

struct LossesPersonnel: Decodable {
    var date: String
    var day: Int
    var personnel: Int
    var personnelPrefix: String
    var prisonerOfWar: Int?
    
    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case personnelPrefix = "personnel*"
        case prisonerOfWar = "POW"
    }
}

struct LossesEquipment: Decodable {
    var date: String
    var day: Int?
    var helicopter: Int
    var tank: Int
    var drone: Int
    var aircraft: Int
    var apc: Int
    var mrl: Int
    var fieldArtillery: Int
    var navalShip: Int
    var antiAircraftWarfare: Int
    var specialEquipment: Int?
    var vehiclesAndFuelTanks: Int?
    var cruiseMissiles: Int?
    var militaryAuto: Int?
    var fuelTank: Int?
    var mobileSRBMSystem: Int?
    var greatestLossesDirection: String?
    
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank, drone
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case mobileSRBMSystem = "mobile SRBM system"
        case greatestLossesDirection = "greatest losses direction"
    }
    
    init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else {
            fatalError()
        }
        
        self.date = (try? container.decode(String.self, forKey: .date)) ?? ""
        if let day = try? container.decodeIfPresent(Int.self, forKey: .day) {
            self.day = day
        } else if let day = try? container.decodeIfPresent(String.self, forKey: .day) {
            self.day = Int(day)
        }
        self.helicopter = (try? container.decode(Int.self, forKey: .helicopter)) ?? 0
        self.tank = (try? container.decode(Int.self, forKey: .tank)) ?? 0
        self.drone = (try? container.decode(Int.self, forKey: .drone)) ?? 0
        self.aircraft = (try? container.decode(Int.self, forKey: .aircraft)) ?? 0
        self.apc = (try? container.decode(Int.self, forKey: .apc)) ?? 0
        self.mrl = (try? container.decode(Int.self, forKey: .mrl)) ?? 0
        self.fieldArtillery = (try? container.decode(Int.self, forKey: .fieldArtillery)) ?? 0
        self.navalShip = (try? container.decode(Int.self, forKey: .navalShip)) ?? 0
        self.antiAircraftWarfare = (try? container.decode(Int.self, forKey: .antiAircraftWarfare)) ?? 0
        self.specialEquipment = (try? container.decode(Int.self, forKey: .specialEquipment)) ?? 0
        self.vehiclesAndFuelTanks = (try? container.decode(Int.self, forKey: .vehiclesAndFuelTanks)) ?? 0
        self.cruiseMissiles = (try? container.decode(Int.self, forKey: .cruiseMissiles)) ?? 0
        self.militaryAuto = (try? container.decode(Int.self, forKey: .militaryAuto)) ?? 0
        self.fuelTank = (try? container.decode(Int.self, forKey: .fuelTank)) ?? 0
        self.mobileSRBMSystem = (try? container.decode(Int.self, forKey: .mobileSRBMSystem)) ?? 0
        self.greatestLossesDirection = (try? container.decode(String.self, forKey: .greatestLossesDirection)) ?? ""
    }
}
