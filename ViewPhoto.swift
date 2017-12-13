//
//  ViewPhoto.swift
//  MyPhotos
//
//  Created by Long, Tran Hoang on 12/13/17.
//  Copyright © 2017 neX. All rights reserved.
//

import UIKit

class ViewPhoto: UIViewController {
    var photoList:[String] = []
    var maxImages: Int = 0
    var imageIndex: NSInteger = 0
    var currentPhotoName = String()
    @IBOutlet weak var viewPhoto: UIImageView!
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        maxImages = photoList.count - 1
        
        viewPhoto.image = UIImage(named: currentPhotoName)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedDir(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedDir(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)

            // Do any additional setup after loading the view.
    }
    
    func swipedDir(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right :
                //println("User swiped right")
                
                // decrease index first
                
                imageIndex -= 1
                
                // check if index is in range
                
                if imageIndex < 0 {
                    
                    imageIndex = maxImages
                    //go to the last photo if the current photo is the first one and user swipes right
                }
                
                viewPhoto.image = UIImage(named: photoList[imageIndex])
                
            case UISwipeGestureRecognizerDirection.left:
                //println("User swiped Left")
                
                // increase index first
                
                imageIndex += 1
                
                // check if index is in range
                
                if imageIndex > maxImages {
                    
                    imageIndex = 0
                    //go to the first photo if the current photo is the last one and user swipes left
                }
                
                viewPhoto.image = UIImage(named: photoList[imageIndex])
                
            default:
                break //stops the code/codes nothing.
            }
        }
        
    }
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
            
    }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    

}
