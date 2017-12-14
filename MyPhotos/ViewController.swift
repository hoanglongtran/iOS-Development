//
//  ViewController.swift
//  MyPhotos
//
//  Created by Long, Tran Hoang on 12/12/17.
//  Copyright © 2017 neX. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    static var photoDes:[String] = []
    
    var photoName:[String] = ["Sayori's Death", "Dead Space", "Lara's Death", "Black Hole", "Cate"]
    
    //let headers:[String] = ["Numbered", "Lettered"]
    
    var temp:String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ViewController.photoDes = Array(repeating: "Your Description", count: photoName.count)
        return ViewController.photoDes.count
    }
    
    //func numberOfSections(in tableView: UITableView) -> Int {
        //return data.count
    //}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ViewController.photoDes[indexPath.row]
        cell.imageView?.image = UIImage(named: photoName[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewPhoto = segue.destination as! ViewPhoto
        viewPhoto.currentPhotoName = temp
        viewPhoto.photoList = photoName
    }
    
    //func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return headers[section]
    //}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        temp = photoName[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

