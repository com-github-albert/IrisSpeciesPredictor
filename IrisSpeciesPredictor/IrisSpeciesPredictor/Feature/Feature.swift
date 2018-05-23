//
//  Feature.swift
//  IrisSpeciesPredictor
//
//  Created by Jett on 2018/5/23.
//  Copyright © 2018 <https://github.com/mutating>. All rights reserved.
//

import Foundation

enum Feature: Int {
    case sepalLength = 0, sepalWidth, petalLength, petalWidth
}

extension Feature {
    static let allCases: [Feature] = [.sepalLength, .sepalWidth, .petalLength, .petalWidth]
}
