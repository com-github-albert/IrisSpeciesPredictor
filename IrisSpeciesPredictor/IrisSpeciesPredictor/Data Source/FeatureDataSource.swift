//
//  FeatureDataSource.swift
//  IrisSpeciesPredictor
//
//  Created by Jett on 2018/5/23.
//  Copyright © 2018 <https://github.com/mutating>. All rights reserved.
//

import Foundation

protocol FeatureDataSource {
    var count: Int { get }
    
    func title(for index: Int) -> String?
    func value(for index: Int) -> Double?
}
