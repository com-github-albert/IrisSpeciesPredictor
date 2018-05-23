//
//  PickerViewDataSource.swift
//  IrisSpeciesPredictor
//
//  Created by Jett on 2018/5/23.
//  Copyright © 2018 <https://github.com/mutating>. All rights reserved.
//

import UIKit

class PickerViewDataSource: NSObject {
    
    // MARK: - Properties
    
    private let sepalLength = SepalLengthDataSource()
    private let sepalWidth = SepalWidthDataSource()
    private let petalLength = PetalLengthDataSource()
    private let petalWidth = PetalWidthDataSource()
    
    // MARK: - Public
    
    func title(for row: Int, feature: Feature) -> String? {
        switch feature {
        case .sepalLength: return sepalLength.title(for: row)
        case .sepalWidth:  return sepalWidth.title(for: row)
        case .petalLength: return petalLength.title(for: row)
        case .petalWidth:  return petalWidth.title(for: row)
        }
    }
    
    func value(for row: Int, feature: Feature) -> Double {
        let value: Double?
        switch feature {
        case .sepalLength: value = sepalLength.value(for: row)
        case .sepalWidth:  value = sepalWidth.value(for: row)
        case .petalLength: value = petalLength.value(for: row)
        case .petalWidth:  value = petalWidth.value(for: row)
        }
        return value!
    }
}

extension PickerViewDataSource: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Feature.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch Feature(rawValue: component)! {
        case .sepalLength: return sepalLength.count
        case .sepalWidth:  return sepalWidth.count
        case .petalLength: return petalLength.count
        case .petalWidth:  return petalWidth.count
        }
    }}

