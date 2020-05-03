//
//  CreatePostViewController.swift
//  Social Media Small Project
//
//  Created by Sakshi Jaiswal on 17/04/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit
import YPImagePicker
import AVKit

class CreatePostViewController: UIViewController {
    
    @IBOutlet weak var txtView_createPost: UITextView!
    @IBOutlet weak var collectionView_post: UICollectionView!
    @IBOutlet weak var btn_photo: UIButton!

    var selectedItems = [YPMediaItem]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func actionDoneButtonPressed(_ sender: Any) {
            }
    @IBAction func actionAddPhoto(_ sender: Any) {
        self.showPicker()
    }
}


//MARK: - YPImagePicker Configuration
extension CreatePostViewController {
    func showPicker() {
        
        var config = YPImagePickerConfiguration()
        config.library.mediaType = .photoAndVideo
        config.shouldSaveNewPicturesToAlbum = false
        config.video.compression = AVAssetExportPresetMediumQuality
        config.startOnScreen = .library
        config.screens = [.library, .photo, .video]
        config.video.libraryTimeLimit = 500.0
        config.showsCrop = .rectangle(ratio: (16/9))
        config.wordings.libraryTitle = "Gallery"
        config.hidesStatusBar = false
        config.hidesBottomBar = false
        config.maxCameraZoomFactor = 2.0
        config.library.maxNumberOfItems = 5
        config.gallery.hidesRemoveButton = false
        config.library.preselectedItems = selectedItems
        
        let picker = YPImagePicker(configuration: config)
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            
            if cancelled {
                print("Picker was canceled")
                picker.dismiss(animated: true, completion: nil)
                return
            }
            _ = items.map { print("🧀 \($0)") }
            
            self.selectedItems = items
            if let firstItem = items.first {
                switch firstItem {
                case .photo(let photo):
                   // self.selectedImageV.image = photo.image
                    print(photo)
                    picker.dismiss(animated: true, completion: nil)
                case .video(let video):
                   // self.selectedImageV.image = video.thumbnail
                    print(video)
                    
                    picker.dismiss(animated: true, completion: { [weak self] in
                        //
                    })
                }
            }
        }
        present(picker, animated: true, completion: nil)
    }
}
