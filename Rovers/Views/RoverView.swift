//
//  RoverView.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import UIKit

class RoverView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(named: "rover")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
