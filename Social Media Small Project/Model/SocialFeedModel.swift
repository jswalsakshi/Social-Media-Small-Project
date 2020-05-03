//
//  SocialFeedModel.swift
//  Social Media Small Project
//
//  Created by Sakshi Jaiswal on 17/04/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

struct SocialFeedModel {
    var id = " "
    var title = " "
    var media = [MediaModel]()
}

struct MediaModel {
    var mediaType: MediaType?
    var thumbnail = UIImage()
    var url = " "
}

enum MediaType {
    case photo, video
}
