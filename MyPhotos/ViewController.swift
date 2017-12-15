//
//  ViewController.swift
//  MyPhotos
//
//  Created by Long, Tran Hoang on 12/12/17.
//  Copyright © 2017 neX. All rights reserved.
//  https://medium.com/yay-its-erica/creating-a-collection-view-swift-3-77da2898bb7c
//https://www.youtube.com/watch?v=7fbTHFH3tl4

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    static var photoDes:[String] = []
    
    @IBAction func addPhoto(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            photo.insert(image, at: photo.count)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    var photoName:[String] = ["Sayori's Death", "Dead Space", "Lara's Death", "Black Hole", "Cate"]
    var photo:[UIImage] = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    /*var flowLayout: UICollectionViewFlowLayout {
        return self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
    }*/
    
    
    var temp:String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.flowLayout.estimatedItemSize = CGSize(width: 100, height: 100)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ViewController.photoDes = Array(repeating: "Your Description", count: photoName.count)
        return photo.count
    }
    
    
    
    //func numberOfSections(in tableView: UITableView) -> Int {
        //return data.count
    //}
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! photoThumbnail
        cell.photoThumb.image = photo[indexPath.row]
        //cell.photoThumb.image = UIImage(named: photoName[indexPath.row])
        
        //cell.textLabel?.text = ViewController.photoDes[indexPath.row]
        //cell.imageView?.image = UIImage(named: photoName[indexPath.row])
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        temp = photoName[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        temp = photoName[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

