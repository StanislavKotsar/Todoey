//
//  Data.swift
//  Todoey
//
//  Created by Станислав Коцарь on 29.01.2018.
//  Copyright © 2018 Станислав Коцарь. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
