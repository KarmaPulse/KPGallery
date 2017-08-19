//
//  GalleryView.swift
//  Kboard_Gallery
//
//  Created by Jose De Jesus Garfias Lopez on 8/11/17.
//  Copyright © 2017 Karmapulse. All rights reserved.
//

import UIKit

/// The UIView class' KP_Gallery wraps every visualization type of the gallery based on configurations.

public class KP_Gallery: UIView {
    
    public var mode = "auto";
    public var images:[gallery_image] = [];
    public var errorMessages: [String:String] = ["":""];


    /// The UIView class' KP_Gallery wraps every visualization type of the gallery based on configurations
    ///
    /// - Parameters:
    ///   - frame: An CGRect to be used to fit the gallery on the screen.
    ///   - images: An [gallery_image] Data Array for render on gallery.
    ///   - mode: mode An String Type of gallery.
    
    public init (frame : CGRect, images: [gallery_image], mode: String) {
        super.init(frame : frame);
        // Init Vars
        self.images = images;
        self.mode = mode;
        self.errorMessages = ["":""];
        
        // Load & Construct Views
        if (self.validateData()) {
            self.reloadView();
        }else {
            self.loadErrorView();
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    public init() {
        super.init(frame : CGRect(x: 0, y: 0, width: 0, height: 0));
    }
    
    public func reloadView() {
        switch self.mode {
        case "auto":
            self.loadAutoModeGallery();
        case "grid":
            self.loadGridModeGallery();
        case "masonry":
            self.loadMasonryModeGallery();
        default:
            self.loadAutoModeGallery();
        }
    }
    
    func validateData() -> Bool {
        return true;
    }
    
    func loadErrorView() {
        
    }

    /// Load the AUTO MODE (Animation standalone).
    func loadAutoModeGallery() {
        
    }
    
    
    func loadGridModeGallery() {
        //Init the KP_Grid.
        let f = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height);
        let grid = KP_Grid(frame: f);
        self.addSubview(grid);
    }
    
    
    func loadMasonryModeGallery() {
        
//        let h = self.frame.height;
//        let w = self.frame.width;
//        
//        print("RELOADING VIEW");
//        print(images.count);
//        
//        var line = 0;
//        var imgCounter = 0;
//        
//        for (i, img) in images.enumerated() {
//            if (imgCounter >= 3) {
//                line += 1;
//                imgCounter = 0;
//            }
//            imgCounter += 1;
//            let f = CGRect(x: ((imgCounter) * 300), y: (line * 300), width: 300, height: 300);
//            let imageView = TweetPhotoView(frame: f, id: i, image: img.url, username: img.username, name: img.profilePhoto);
//            print(imageView.frame);
//            self.addSubview(imageView);
//        }

    
    }
}
