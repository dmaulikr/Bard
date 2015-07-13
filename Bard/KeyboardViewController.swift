//
//  KeyboardViewController.swift
//  Bard
//
//  Created by Test Account on 7/6/15.
//  Copyright (c) 2015 Vibin Kundukulam. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var capsLockOn = true
 
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiateWithOwner(self, options: nil)
        view = objects[0] as! UIView;
    }
    
    @IBAction func nextKeyboardPressed(button: UIButton) {
        advanceToNextInputMode()
    }
    
    @IBAction func capsLockPressed(button: UIButton) {
        capsLockOn = !capsLockOn
    }
    
    @IBAction func keyPressed(button: UIButton) {
        var string = button.titleLabel!.text
        (textDocumentProxy as! UIKeyInput).insertText("\(string!)")
        UIView.animateWithDuration(0.2, animations: {
            button.transform = CGAffineTransformScale(CGAffineTransformIdentity,2.0,2.0)}
            , completion: {(_) -> Void in
                button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1,1)
        })
        
    }
    
    @IBAction func backSpacePressed(button: UIButton) {
        (textDocumentProxy as! UIKeyInput).deleteBackward()
    }
    
    @IBAction func spacePressed(button: UIButton) {
        (textDocumentProxy as! UIKeyInput).insertText(" ")
    }
    
    @IBAction func returnPressed(button: UIButton) {
        (textDocumentProxy as! UIKeyInput).insertText("\n")
    }
    
    func changeCaps(containerView: UIView) {
        for view in containerView.subviews {
            if let button = view as? UIButton {
                let buttonTitle = button.titleLabel!.text
                if capsLockOn {
                    let text = buttonTitle!.uppercaseString
                    button.setTitle("\(text)", forState:.Normal)
                } else {
                    let text = buttonTitle!.lowercaseString
                    button.setTitle("\(text)", forState: .Normal)
                }
            }
        }
    }
    
}
