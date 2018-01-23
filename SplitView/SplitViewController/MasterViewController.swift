//
//  MasterViewController.swift
//  SplitViewController
//
//  Created by Özcan AKKOCA on 15.06.2017.
//  Copyright © 2017 Özcan AKKOCA. All rights reserved.
//

// dikkat edilmesi gereken nokta cell'den detail tıklayınca Push olayını show detail olarak yapmak.

import UIKit

class MasterViewController: UITableViewController {

    var arr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arr = ["Red", "Blue", "Green"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arr[indexPath.row]

        return cell
    }
 


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "show" {
            let ctrl = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            
            let color = arr[(indexPath?.row)!]
            
            if color == "Red" {
                ctrl.view.backgroundColor = UIColor.red
            } else if color == "Blue" {
                ctrl.view.backgroundColor = UIColor.blue
            } else {
                ctrl.view.backgroundColor = UIColor.green
            }
            
        }
    }


}
