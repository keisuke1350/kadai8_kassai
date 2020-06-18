//
//  Task.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/18.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import Foundation

class Task: Codable{
    var title: String
    var memo: String?
    var select: String

    
    init(title: String, memo: String = "",select: String = ""){
        self.title = title
        self.memo = memo
        self.select = select
    }
}
