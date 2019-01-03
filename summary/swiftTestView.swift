//
//  swiftTestView.swift
//  summary
//
//  Created by NewBoy on 2018/12/28.
//  Copyright © 2018年 LX. All rights reserved.
//

import UIKit

class swiftTestView: UIView {

    @objc public var tempStr: String

    override init(frame: CGRect) {

        self.tempStr = ""
        super.init(frame: frame)

        setupUI()

    }

    required init?(coder aDecoder: NSCoder) {
        self.tempStr = ""
        super.init(coder: aDecoder)

        setupUI()

    }


    func setupUI() ->() {

        print("hhhhhhhh")
    }



}
