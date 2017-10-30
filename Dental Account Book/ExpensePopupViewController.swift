//
//  ExpensePopupViewController.swift
//  Dental Account Book
//
//  Created by Apple on 10/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import CoreData


class ExpensePopupViewController: UIViewController {

    @IBOutlet weak var expenseNameText: UITextField!
    @IBOutlet weak var expenseAmountText: UITextField!
    @IBOutlet weak var closeExpensePopup: UIButton!
    @IBOutlet weak var cancelExpensePopupWithoutSave: UIButton!
    @IBOutlet weak var datePickerText: UITextField!
    
    var clinicExpenseArr = [ClinicExpense]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //to make the main view controller transparent
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()
        
        dateFormatter.dateStyle = .long
        datePickerText.text = dateFormatter.string(from: Date())
        
        createDatePickerForClinicExpense()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createDatePickerForClinicExpense(){
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
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        
        datePickerText.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    @IBAction func closeExpensePopup(_ sender: UIButton) {
        
        let clinicExpense = ClinicExpense(context: PersistenceService.context)
        expenseNameText.text = clinicExpense.expenseName
        expenseAmountText.text = String(clinicExpense.amount)
        
        clinicExpenseArr.append(clinicExpense)
        PersistenceService.saveContext()
        
        
        
        self.removeAnimate()
        
    }
    
    @IBAction func cancelExpensePopupWithoutSave(_ sender: UIButton) {
        self.removeAnimate()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
