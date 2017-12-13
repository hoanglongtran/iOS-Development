//
//  ViewPhoto.swift
//  MyPhotos
//
//  Created by Long, Tran Hoang on 12/13/17.
//  Copyright © 2017 neX. All rights reserved.
//  https://grokswift.com/uitextfield/
//  https://stackoverflow.com/questions/31446237/how-to-edit-label-with-touch-ios-swift

import UIKit

class ViewPhoto: UIViewController, UITextFieldDelegate {
    var photoList:[String] = []
    var photoNumb:Int = 0
    var maxImages: Int = 0
    var imageIndex: NSInteger = 0
    var currentPhotoName = String()
    let photoDescription = [String]()
    @IBOutlet weak var viewPhoto: UIImageView!
    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var lbl: UILabel!
    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let characterCountLimit = 140
        
        let startingLength = textField.text?.characters.count ?? 0
        let lengthToAdd = string.characters.count
        let lengthToReplace = range.length
        let newLength = startingLength + lengthToAdd - lengthToReplace
    
        return newLength <= characterCountLimit
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }*/
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maxImages = photoList.count - 1
        viewPhoto.image = UIImage(named: currentPhotoName)
        imageIndex  = photoList.index(of: currentPhotoName)!
        
        lbl.text = photoDescription[imageIndex]
        textF.delegate = self
        textF.isHidden = true
        lbl.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewPhoto.lblTapped))
        tapGesture.numberOfTapsRequired = 1
        lbl.addGestureRecognizer(tapGesture)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedDir(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedDir(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        
        
            // Do any additional setup after loading the view.
    }
    
    func lblTapped(){
        lbl.isHidden = true
        textF.isHidden = false
        textF.text = lbl.text
    }
    
    func textFieldShouldEndEditing(_ userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        textF.isHidden = true
        lbl.isHidden = false
        photoDescription[imageIndex] = textF.text!
        lbl.text = photoDescription[imageIndex]
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    func swipedDir(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right :
                //println("User swiped right")
                
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
