//
//  MainModel.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import Foundation

protocol MainModel {
    var recognizedText: String { get }
    var selectedAnimal: AnimalType { get }
}

final class MainModelImpl: MainModel {
    var recognizedText: String = ""
    var selectedAnimal: AnimalType = .dog
    init() {}
}

enum AnimalType {
    case cat
    case dog
}
