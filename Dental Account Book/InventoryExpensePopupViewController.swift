//
//  InventoryExpensePopupViewController.swift
//  Dental Account Book
//
//  Created by Apple on 10/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import CoreData

class InventoryExpensePopupViewController: UIViewController {
    @IBOutlet weak var datePickerText: UITextField!
    @IBOutlet weak var materialNameText: UITextField!
    @IBOutlet weak var numberOfUnitsText: UITextField!
    @IBOutlet weak var costPerUnitText: UITextField!
    @IBOutlet weak var totalCostDisplayLabel: UILabel!
    @IBOutlet weak var addInventoryExpensePopupAndClose: UIButton!
    
    @IBOutlet weak var cancelInventoryExpensePopupWithoutSave: UIButton!
    
    var createDatePicker = PatientEntryViewController()
    var inventoryExpenseArr = [InventoryExpense]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()
        
        
        //load current date
        
        dateFormatter.dateStyle = .long
        datePickerText.text = dateFormatter.string(from: Date())
    
       createDatePickerForInventory()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - createDatePicker load and dismiss and enter date in text field
    func createDatePickerForInventory(){
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addInventoryExpensePopupAndClose(_ sender: UIButton) {
        let inventoryExpense = InventoryExpense(context: PersistenceService.context)
    
        datePickerText.text = String(describing: inventoryExpense.date)
        materialNameText.text = inventoryExpense.materialName
        numberOfUnitsText.text = String(inventoryExpense.numberOfUnits)
        costPerUnitText.text = String(inventoryExpense.costPerUnit)
        PersistenceService.saveContext()
        inventoryExpenseArr.append(inventoryExpense)
       self.removeAnimate()
        
    }
    
    @IBAction func cancelInventoryExpensePopupWithoutSave(_ sender: UIButton) {
        self.removeAnimate()
    }
    
}
