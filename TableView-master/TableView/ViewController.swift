//
//  ViewController.swift
//  TableView
//
//  Created by Özcan AKKOCA on 2.06.2017.
//  Copyright © 2017 Özcan AKKOCA. All rights reserved.
//


// TableView sürükledikten sonra datasource ve delegate bağlantıları yapılmalı.
// Cell oluşturulduktan sonra identifier koddaki gibi withIdentifier: "cell" olmalı.
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let names:[String] = [
        "Margherita Pizza","BBQ Chicken Pizza",
        "Pepperoni Pizza","Sausage Pizza",
        "Seafood Pizza","Sausage Deep Dish",
        "Meat Lover's Deep Dish","Veggie Lover's Deep Dish",
        "BBQ Chicken Deep Dish","Mushroom Deep Dish",
        "Tiramisu","Vanilla Ice Cream",
        "Apple Crostata","Hot Fudge Pizza",
        "Soft Drink","Coffee",
        "Espresso","Mineral Water"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    


}

extension ViewController {
    // Section sayısı 1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Listede kaç eleman bulunacağı.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    // Cell oluşturma ve bağlantısı
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}

