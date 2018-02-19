//
//  ViewController.swift
//  rabbitGame
//
//  Created by Timo Engelvaart on 16-02-18.
//  Copyright © 2018 Timo Engelvaart. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
    var randomBunnyIndex1 : Int = 0
    
    let bunnyArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let bunnyArray2 = ["9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    let bunnyArray3 = ["end1" , "end2" , "end3" , "end4"]
    
    @IBOutlet weak var bunnyImageView1: UIImageView!
    @IBOutlet weak var bunnyImageView2: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var ending: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide ending image
        ending.isHidden = true
        
        // create tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(gesture:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(gesture:)))
        
        // add it to the image view
        bunnyImageView1.addGestureRecognizer(tapGesture)
        bunnyImageView2.addGestureRecognizer(tapGesture2)
        
        // make sure imageView can be interacted with by user
        bunnyImageView1.isUserInteractionEnabled = true
        bunnyImageView2.isUserInteractionEnabled = true
    }
    
    // used for selecting correct bunny picture
    var counter : Int = 0
    
    // used for selecting correct end image(this is also a bunny)
    var randomBunnyIndex: Int = 0
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            counter += 1
            randomBunnyIndex = Int(arc4random_uniform(5))
            
            if counter < 9 {
                print(counter)
                bunnyImageView1.image = UIImage(named: bunnyArray[counter])
                bunnyImageView2.image = UIImage(named: bunnyArray2[counter])
            }
            else {
                ending.isHidden = false
                ending.image = UIImage(named: bunnyArray3[randomBunnyIndex])
                self.text.text = "You are a"
                bunnyImageView1.isHidden = true
                bunnyImageView2.isHidden = true
            }
        }
    }
}






