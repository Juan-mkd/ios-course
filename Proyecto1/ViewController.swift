//
//  ViewController.swift
//  Proyecto1
//
//  Created by Juan Esteban Calderon Ovalle on 4/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myPagesControl: UIPageControl!
    @IBOutlet weak var myPickerView: UIPickerView!
    // Outlests
    @IBOutlet weak var myButton: UIButton!
    
    //variables
    private let myPickerViewValues = ["uno","dos","tres","cuantro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //butons
        myButton.setTitle("mi boto", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(UIColor.white, for: .normal)
        
        //pickers
        myPickerView.backgroundColor = .red
        myPickerView.dataSource = self
        myPickerView.delegate = self
        
        
        //pages controls
        myPagesControl.numberOfPages = myPickerViewValues.count
        myPagesControl.currentPageIndicatorTintColor = .blue
        myPagesControl.pageIndicatorTintColor = .lightGray
        
        
    }
    //actions
    
    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
            myButton.setTitleColor(UIColor.black, for: .normal)
        } else {
            myButton.backgroundColor = .blue
        }
    }
    
    
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
    }
    
    
}
