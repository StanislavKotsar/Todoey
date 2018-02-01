//
//  Item.swift
//  Todoey
//
//  Created by Станислав Коцарь on 30.01.2018.
//  Copyright © 2018 Станислав Коцарь. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
