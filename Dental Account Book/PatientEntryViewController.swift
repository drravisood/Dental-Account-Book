//
//  PatientEntryViewController.swift
//  Dental Account Book
//
//  Created by Apple on 10/24/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class PatientEntryViewController: UIViewController {
    @IBOutlet weak var patientNameText: UITextField!
    @IBOutlet weak var opdNumberText: UITextField!
    @IBOutlet weak var totalInvoiceText: UITextField!
    @IBOutlet weak var amountPaidText: UITextField!
    @IBOutlet weak var datePaidText: UITextField!
    @IBOutlet weak var balanceDueText: UITextField!
    @IBOutlet weak var datePickerText: UITextField!
    
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        
        //load current date
        
        dateFormatter.dateStyle = .long
        datePickerText.text = dateFormatter.string(from: Date())
        // Do any additional setup after lo ading the view.
    }
      
    

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // MARK: - createDatePicker load and dismiss and enter date in text field
    func createDatePicker(){
        //format for datePicker
        datePicker.datePickerMode = .date
    
        //Toolbar
        let toolbar = UIToolbar()
      
        toolbar.sizeToFit()
        
    
        //barButtonItem
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        datePickerText.inputAccessoryView = toolbar
        
        
        //assigning datePicker to text field
        datePickerText.inputView = datePicker
        //datePicker.addTarget(self, action: Selector(("Datechanged")), for: .valueChanged)
        
    }
    
    @objc func donePressed(){
        //to view correct format of date
        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        
        
        datePickerText.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

  

    @IBAction func addPatientName(_ sender: UIButton) {
    }
    

    
}