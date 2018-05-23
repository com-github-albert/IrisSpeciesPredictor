//
//  ViewController+PickerViewDelegate.swift
//  IrisSpeciesPredictor
//
//  Created by Jett on 2018/5/23.
//  Copyright © 2018 <https://github.com/mutating>. All rights reserved.
//

import UIKit

extension ViewController: UIPickerViewDelegate {
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        prediction()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let feature = Feature(rawValue: component)
            else {
                fatalError("Invalid component \(component) found to represent a \(Feature.self). This should not happen based on the configuration set in the storyboard.")
        }
        return pickerViewDataSource.title(for: row, feature: feature)
    }
}
