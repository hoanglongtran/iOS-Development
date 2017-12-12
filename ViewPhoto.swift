//
//  ViewPhoto.swift
//  MyPhotos
//
//  Created by Long, Tran Hoang on 12/13/17.
//  Copyright © 2017 neX. All rights reserved.
//

import UIKit

class ViewPhoto: UIViewController {
    var name = String()
    @IBOutlet weak var viewPhoto: UIImageView!
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewPhoto.image = UIImage(named: name)
            // Do any additional setup after loading the view.
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
