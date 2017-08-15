//
//  Entry.swift
//  dtc-travel-app
//
//  Created by Quyen Castellanos on 8/14/17.
//  Copyright © 2017 Pariveda. All rights reserved.
//

import Foundation
import UIKit

class Entry {
    var type:String
    var title:String?
    var imageString:String?
    var textEntry:String?
    var category:String
    
    init (type:String, title:String? = nil, imageString:String? = nil, textEntry:String? = nil, category:String) {
        self.type = type
        self.title = title
        self.imageString = imageString
        self.textEntry = textEntry
        self.category = category
    }
}
