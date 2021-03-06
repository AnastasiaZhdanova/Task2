//
//  ViewController.swift
//  Task2
//
//  Created by student on 8/2/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
       //Check TextField

    }
    @IBAction func tapGenerateButton(_ sender: Any) {
        view.endEditing(true)
        guard let text = textField.text else {
            return
        }
            var amountOfView = Double(text)
            //Clear screen
            for subview in mainView.subviews as [UIView]   {
                subview.removeFromSuperview()
            }
            createNewView(count: amountOfView!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       view.endEditing(true)
        
    }
    
    func createNewView(count: Double){
        var i = count
        var stepHeight =  0.0
        var stepWidth = 0.0
        let indent = 10.0
        
        var width = Double(mainView.frame.size.width)/count
        var height = Double(mainView.frame.size.height)/count
        while i > 0 {
            var newView = UIView(frame: CGRect(x: stepWidth, y: stepHeight, width: width, height: height))
            
            newView.backgroundColor = .random
            self.mainView.addSubview(newView)
            
            stepHeight = stepHeight + indent
            stepWidth = stepWidth + indent
            
            i = i - 1
        }
    }
    
}

//MARK: - Random Colour
extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}


