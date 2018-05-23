//
//  SepalWidthDataSource.swift
//  IrisSpeciesPredictor
//
//  Created by Jett on 2018/5/23.
//  Copyright © 2018 <https://github.com/mutating>. All rights reserved.
//

import Foundation

struct SepalWidthDataSource {
    private var values: [Double] = {
        var array = [Double]()
        array.append(0.0)
        var i = 2.0;
        repeat {
            array.append(Double(i))
            i += 0.3
        } while (i <= 4)
        array.append(10.0)
        return array
    }()
}

extension SepalWidthDataSource: FeatureDataSource {
    var count: Int {
        return values.count
    }
    
    func title(for index: Int) -> String? {
        guard index < values.count else { return nil }
        return String(values[index])
    }
    
    func value(for index: Int) -> Double? {
        guard index < values.count else { return nil }
        return Double(values[index])
    }
}
