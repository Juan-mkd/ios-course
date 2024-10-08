//
//  ViewController.swift
//  Proyecto1
//
//  Created by Juan Esteban Calderon Ovalle on 4/10/24.
//

import UIKit

class ViewController: UIViewController {
    // Outlests
    @IBOutlet weak var myPagesControl: UIPageControl!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var mySteper: UIStepper!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var mySegmenteControl: UISegmentedControl!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet var myProgresview: UIView!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    
    
    
    
    //variables
    private let myPickerViewValues = ["uno","dos","tres","cuantro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //butons
        myButton.setTitle("mi boto", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(UIColor.white, for: .normal)
        
        //pickersview
        myPickerView.backgroundColor = .red
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        
        //pages controls
        myPagesControl.numberOfPages = myPickerViewValues.count
        myPagesControl.currentPageIndicatorTintColor = .blue
        myPagesControl.pageIndicatorTintColor = .lightGray
        
        //mySegmenteControl
        
        mySegmenteControl.removeAllSegments()
        for (index, value) in myPickerViewValues.enumerated() {
            mySegmenteControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        
        //sliders
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.value = 3
        
        
        //steppers
        mySteper.minimumValue = 1
        mySteper.maximumValue = Double(myPickerViewValues.count)
        
        //switch
        mySwitch.onTintColor = .purple
        mySwitch.isOn = false
        
        
        // progress indicator
//        myProgresview.
        
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
    
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPagesControl.currentPage, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[myPagesControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        
        
        mySegmenteControl.selectedSegmentIndex = myPagesControl.currentPage
    }
    
    
    @IBAction func mySegmentsControlAction(_ sender: Any) {
        myPickerView.selectRow(mySegmenteControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[myPagesControl.currentPage]
        myButton.setTitle(myString, for: .normal)
        
        myPagesControl.currentPage = mySegmenteControl.selectedSegmentIndex
    }
    
    
    @IBAction func mySliderAction(_ sender: Any) {
        switch mySlider.value {
        case 1..<2:
            mySegmenteControl.selectedSegmentIndex = 0
        case 2..<3:
            mySegmenteControl.selectedSegmentIndex = 1
        case 3..<4:
            mySegmenteControl.selectedSegmentIndex = 2
        case 4..<5:
            mySegmenteControl.selectedSegmentIndex = 3
        default:
            mySegmenteControl.selectedSegmentIndex = 4
        }
        
        
        
        }
    
    @IBAction func mySteperAction(_ sender: Any) {
            let value = mySteper.value
            mySlider.value = Float(value)
            
    }
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn {
            myPickerView.isHidden = false
        } else {
            myPickerView.isHidden = true
            
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
        
        myPagesControl.currentPage = row
        
        mySegmenteControl.selectedSegmentIndex = row
    }
    


}
