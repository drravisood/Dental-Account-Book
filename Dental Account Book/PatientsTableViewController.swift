//
//  PatientsTableViewController.swift
//  Dental Account Book
//
//  Created by Apple on 10/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import CoreData

class PatientsTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var patientFetchArr = [Patients]()
    
    lazy var fetchedResultsControler: NSFetchedResultsController = { () -> NSFetchedResultsController<NSFetchRequestResult> in
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Patients")
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "patientName", ascending: true)]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        return controller
    }()
    
  
    
    
    //var patientEntryViewController = PatientEntryViewController().patientArr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedResultsControler.delegate = self
        
        
        do {
            try fetchedResultsControler.performFetch()
    
            self.tableView.reloadData()
            
        }
         catch {
            fatalError("Failed to fetch entities: \(error)")
        }
    
        
        //fetch req for core data
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
//        let patientFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Patients")
//        patientFetchRequest.returnsObjectsAsFaults = false
//        do {
//            if let patientArr = try context.fetch(patientFetchRequest) as? [Patients] {
//                self.patientFetchArr = patientArr
//                self.tableView.reloadData()}
//
//
//        }
//        catch {
//            fatalError("Failed to fetch employees: \(error)")
//        }
//

        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    
    
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections

        
        return 1
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return (fetchedResultsControler.sections?[0].numberOfObjects)!
        
    }

    // Table view cells are reused and should be dequeued using a cell identifier.
    let cellIdentifier = "SinglePatientEntryTableViewCell"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? SinglePatientEntryTableViewCell else {
            fatalError("The dequeued cell is not an instance of SinglePatientEntryTableViewCell.")
            
        }
        // Fetches the appropriate patient entry for the data source layout.
       let patient = fetchedResultsControler.object(at: indexPath) as! Patients

        // Configure the cell...
        
        
        
        cell.dateLabel.text = String(describing: patient.datePicker)
        cell.patientnameLabel.text = patient.patientName
        cell.opdNumberLabel.text = String(patient.opdNumber)
        cell.amountPaidLabel.text = String(patient.amountPaid)
        cell.dateLabel.text = String(describing: patient.datePaid)
        cell.balanceLabel.text = String(patient.balanceDue)

       
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
