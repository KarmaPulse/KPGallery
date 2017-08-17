//
//  KP_Photo.swift
//  Kboard_Gallery
//
//  Created by Jose De Jesus Garfias Lopez on 8/10/17.
//  Copyright © 2017 Karmapulse. All rights reserved.
//

import UIKit

class KP_Photo: UIView {
    
    var id = -1;
    var image = "";
    var username = "";
    var name = "";

    init (frame : CGRect, id: Int, image: String, username: String, name: String) {
        super.init(frame : frame);
        
        // Init Vars
        self.id = id;
        self.image = image;
        self.username = username;
        self.name = name;
        
        // Init Gestures
        let touch = UITapGestureRecognizer(target: self, action: #selector(onTouchView));
        touch.allowedPressTypes = [NSNumber(value: UIPressType.playPause.rawValue)]; // for tvOS
        self.addGestureRecognizer(touch);
        
        // Load & Construct View
        self.reloadView();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    func reloadView() {
        let url = URL(string: self.image);
        self.getDataFromUrl(url: url!) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                if let img = UIImage(data:data as Data) {
                    let resizedImg = img.resizeImage(targetSize: CGSize(width: self.frame.width, height: self.frame.height));
                    let imgV = UIImageView(image: resizedImg);
                    //self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: resizedImg.size.width, height: resizedImg.size.height);
                    self.addSubview(imgV);
                }
            }
        }
    }
    
    func onTouchView() {
        print("Touched");
    }

    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume();
    }
}


extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

