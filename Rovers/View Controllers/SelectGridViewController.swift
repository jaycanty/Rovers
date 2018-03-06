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
    @IBOutlet weak var nextButton: UIBarButtonItem!
    fileprivate var gridSize: Int! = GridModel.shared.gridSize {
        didSet {
            GridModel.shared.gridSize = gridSize
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gridSizeTextField.text = ""
        gridSizeDisplayLabel.text = ""
        nextButton.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
}

extension SelectGridViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let input = ((textField.text as NSString?) ?? "")
            .replacingCharacters(in: range, with: string)
        gridSize = Int(input) ?? 0
        if (gridSize >= 4) && (gridSize <= 20) {
            self.gridSizeDisplayLabel.text = gridSize == 0 ? "" : "\(input) X \(input)"
            self.nextButton.isEnabled = true
        } else {
            self.gridSizeDisplayLabel.text = "Grid size range: 4-20"
            self.nextButton.isEnabled = false
        }
        return true
    }
}
