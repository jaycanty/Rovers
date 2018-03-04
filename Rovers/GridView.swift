//
//  GridView.swift
//  Rovers
//
//  Created by Jay Canty on 3/4/18.
//  Copyright © 2018 JC. All rights reserved.
//

import UIKit

class GridView: UIView {
    var position: (Int, Int)!
    
    init(frame: CGRect, position: (Int, Int)) {
        super.init(frame: frame)
        self.position = position
        backgroundColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let notification = Notification(
            name: .gridViewPressed,
            object: self,
            userInfo: nil
        )
        NotificationCenter.default.post(notification)
    }
}
