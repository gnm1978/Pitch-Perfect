//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Ghassan Mohammed on 2/9/15.
//  Copyright (c) 2015 Ghassan Mohammed. All rights reserved.
//

import UIKit

class RecordedAudio: NSObject {
    
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl:NSURL, title:String) {
        
        self.filePathUrl = filePathUrl
        self.title = title
        
    }
}
