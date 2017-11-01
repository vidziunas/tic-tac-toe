//
//  ViewController.swift
//  tic tac toe
//
//  Created by Nedas on 31/10/2017.
//  Copyright © 2017 Nedas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var aktyvuszaidejas = 1 //Kryziukas
    var zaidimopagrindas = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
    
    let laimejimas = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var aktyvuszaidimas = true
    
    @IBOutlet weak var label: UILabel!
    @IBAction func action(_ sender: AnyObject)
    {
        if (zaidimopagrindas[sender.tag-1] == 0 && aktyvuszaidimas == true)
        {
            
            zaidimopagrindas[sender.tag-1] = aktyvuszaidejas
                if (aktyvuszaidejas == 1)
            {
                sender.setImage(UIImage(named: "cross.jpg"), for: UIControlState())
                aktyvuszaidejas = 2
            }
            else
            {
                sender.setImage(UIImage(named: "nought.png"), for: UIControlState())
                aktyvuszaidejas = 1
            }
        
        }
        
        for combination in laimejimas
        {
            if zaidimopagrindas[combination[0]] != 0 && zaidimopagrindas[combination[0]] == zaidimopagrindas[combination[1]] && zaidimopagrindas[combination[1]] == zaidimopagrindas[combination[2]]
            {
                aktyvuszaidimas = false
                if zaidimopagrindas[combination[0]] == 1
            
                {
              
                    label.text = "Kryziukas laimejo!"
                }
                else
                {
              label.text = "Nuliukas laimejo"
                }
                
                zaistidarkartamygtukas.isHidden = false
                label.isHidden = false
                
            }
        }
        aktyvuszaidimas = false
        for i in zaidimopagrindas
        {
             if i == 0
             {
                aktyvuszaidimas  = true
                break
            }
        }
        if aktyvuszaidimas == false
        {
            label.text = "Lygios"
            label.isHidden = false  
            zaistidarkartamygtukas.isHidden = false
        }

    }
    
    @IBOutlet weak var zaistidarkartamygtukas: UIButton!
    @IBAction func zaistidarkarta(_ sender: Any)
    {
        zaidimopagrindas = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
        aktyvuszaidimas = true
        aktyvuszaidejas = 1
        
        zaistidarkartamygtukas.isHidden = true
        label.isHidden = true
        
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for:UIControlState())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

