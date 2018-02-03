//
//  Category.swift
//  Todoey
//
//  Created by Станислав Коцарь on 30.01.2018.
//  Copyright © 2018 Станислав Коцарь. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    let items = List<Item>()
}
