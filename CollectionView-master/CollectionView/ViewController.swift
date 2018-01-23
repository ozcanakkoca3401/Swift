//
//  ViewController.swift
//  CollectionView
//
//  Created by Umut Karagoz on 2.06.2017.
//  Copyright © 2017 Umut Karagoz. All rights reserved.
//


//Uygulama çalıştırıldığında 10 adet kırmızı kutucuk göstercekir. Stroyboardta cell in identifierına Cell belirtilmelidir. DataSource ve Delegeta metodları storyboardta bağlanmalıdır. CollectionView ekran boyutunda sağ sol alt üstten 0 olarak constraint verilmelidir.

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    //CollectionView içerisinde kaç adat kutucuk gösterilecekse o kadar sayı return edilmelidir. Biz 10 kutucuk için 10 döndürdük.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //Aşağıdaki foksiyonda cellidentifiera atanan Cell storyboardataki cell deki identifierdan gelmektedir.
    //    cell ile ilgili yapılacak olan değişiklikler ikinci collectionview fonksiyonu içerisinde yapılmalıdır.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cellidentifier="Cell"
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath)
        cell.backgroundColor=UIColor.red
        
        return cell
    
    }

}

