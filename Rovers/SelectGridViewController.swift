//
//  SelectGridViewController.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import UIKit

class SelectGridViewController: UIViewController {
    
    @IBOutlet weak var gridSizeTextField: UITextField!
    @IBOutlet weak var gridSizeDisplayLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    fileprivate var gridSize: Int! = GridModel.shared.gridSize {
        didSet {
            GridModel.shared.gridSize = gridSize
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SelectGridViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let input = ((textField.text as NSString?) ?? "")
            .replacingCharacters(in: range, with: string)
        gridSize = Int(input) ?? 0
        if (gridSize > 4) && (gridSize < 40) {
            self.gridSizeDisplayLabel.text = gridSize == 0 ? "" : "\(input) X \(input)"
            self.nextButton.alpha = 1
        } else {
            self.gridSizeDisplayLabel.text = "Grid size range: 4-40"
            self.nextButton.alpha = 0
        }
        return true
    }
}
