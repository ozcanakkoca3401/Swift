//
//  tableViewC.swift
//  popupOverMenu
//
//  Created by Adem on 9.08.2017.
//  Copyright © 2017 Adem. All rights reserved.
//

import UIKit
//import UIModalPresentationPopover
//import UIPopoverPresentationController

class tableViewC: UITableViewController,UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.rowHeight=80
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table view data source

    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell123", for: indexPath)

        // Configure the cell...
    
        let button = UIButton(frame: CGRect(x: 303, y: 24, width: 86, height: 30))
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(tableViewC.buttonClicked(_:)), for:
            UIControlEvents.touchUpInside)
        button.setTitle("Click Me !", for: UIControlState.normal)
        cell.addSubview(button)

        return cell
    }
    func buttonClicked(_ sender: Any) {
        
        // let button = sender as! UIButton
        let popoverViewController = menuTableViewC()
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.preferredContentSize   = CGSize(width: 100, height: 75)
        
        let popoverPresentationViewController = popoverViewController.popoverPresentationController
        
        popoverPresentationViewController?.permittedArrowDirections = [.up, .down]
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = sender as? UIView
        popoverPresentationViewController?.sourceRect = (sender as AnyObject).bounds
        
        
        present(popoverViewController, animated: true, completion: nil)
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
