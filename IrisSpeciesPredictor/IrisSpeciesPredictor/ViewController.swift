//
//  ViewController.swift
//  IrisSpeciesPredictor
//
//  Created by Jett on 2018/5/23.
//  Copyright © 2018 <https://github.com/mutating>. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    let model = Iris()
    
    let pickerViewDataSource = PickerViewDataSource()
    
    // MARK: - Outlets
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = pickerViewDataSource
            
            for feature in Feature.allCases {
                pickerView.selectRow(2, inComponent: feature.rawValue, animated: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prediction()
    }

    func prediction() {
        func selectedRow(for feature: Feature) -> Int {
            return pickerView.selectedRow(inComponent: feature.rawValue)
        }
        
        let sepalLength = pickerViewDataSource.value(for: selectedRow(for: .sepalLength), feature: .sepalLength)
        let sepalWidth  = pickerViewDataSource.value(for: selectedRow(for: .sepalWidth), feature: .sepalWidth)
        let petalLength = pickerViewDataSource.value(for: selectedRow(for: .petalLength), feature: .petalLength)
        let petalWidth  = pickerViewDataSource.value(for: selectedRow(for: .petalWidth), feature: .petalWidth)
        
        let input = IrisInput(SepalLength: sepalLength, SepalWidth: sepalWidth, PetalLength: petalLength, PetalWidth: petalWidth)
        guard let output =
            try? model.prediction(input: input)
            else {
                fatalError("Unexpected runtime error.")
        }
        
        priceLabel.text = output.Species
    }
}

