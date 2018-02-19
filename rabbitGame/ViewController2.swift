//
//  ViewController.swift
//  rabbitGame
//
//  Created by Timo Engelvaart on 16-02-18.
//  Copyright © 2018 Timo Engelvaart. All rights reserved.
//

//Automatically generated import statement.
import UIKit

//Automatically generated class.
class ViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate{
   
   // var randomBunnyIndex1 : Int = 0
    
    //@IBAction func click(_ sender: Any) {
      //  randomBunnyIndex1 = Int(arc4random_uniform(6))
        
        //print(randomBunnyIndex1)
    //}
    @IBOutlet weak var bunnyImageView1: UIImageView!
    let imagePicker = UIImagePickerController()
    var tapGesher = UITapGestureRecognizer()
    
    @IBOutlet weak var bunnyImageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesher = UITapGestureRecognizer(target: self, action: #selector(self.openPhoto))
        tapGesher.numberOfTapsRequired = 1
        self.bunnyImageView1.addGestureRecognizer(tapGesher)
        self.bunnyImageView1.isUserInteractionEnabled = true
        
        imagePicker.delegate = self

        }
    @objc func openPhoto() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.bunnyImageView1.image = image
            self.imagePicker.dismiss(animated: true, completion:nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}


