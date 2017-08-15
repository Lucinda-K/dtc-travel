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
    var title:String?
    var image:UIImage?
    var textEntry:String?
    var category:String
    
    init (title:String? = nil, image:UIImage? = nil, textEntry:String? = nil, category:String) {
        self.title = title
        self.image = image
        self.textEntry = textEntry
        self.category = category
    }
}
