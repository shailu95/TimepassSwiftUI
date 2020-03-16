//
//  AttendanceModal.swift
//  PerkCM
//
//  Created by Shailendra vishwakarma on 16/03/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import Foundation

class AttendanceModal: ObservableObject {
    var data1 = ["1", "2", "3"]
    var data2 = ["1","2"]
    var d : Bool = false
    
    var MainData = [String]()
    
    public func transfer(){
        MainData = data2
    }
    
    init() {
        MainData = data1
    }
}
