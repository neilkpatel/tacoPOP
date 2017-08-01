//
//  MainVC.swift
//  tacoPOP
//
//  Created by Neil Patel on 7/30/17.
//  Copyright © 2017 Neil Patel. All rights reserved.
//

import UIKit

class MainVC: UIViewController, DataServiceDelegate {
    
    @IBOutlet weak var headerView: HeaderView! //you created this type of class
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ds: DataService = DataService.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        ds.delegate = self //delegate protocol we defined, we will get notified when data is done downloading. as soon as done downloading, will run function below
        ds.loadDeliciousTacoData()
        ds.tacoArray.shuffle()
        
        headerView.addDropShadow()
        
        //load nib, old way of doing it...
//        let nib = UINib(nibName: "TacoCell", bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: "TacoCell")
        collectionView.register(TacoCell.self) //replaces code above, don't have to keep up with reuse identifiers / nibnames above.
    }

    func deliciousTacoDataLoaded() {
        print("Delicious Taco Data Loaded")
        collectionView.reloadData() // if you're connecting to firebase, asynch call, when it is done then you can fire delegate method off and let other class know it is loaded. then you can do reload data. here all data is on system.
    }
    
//need to setup delegate/datasource for collectionview. like to use extensions because it keeps code organized better.


}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ds.tacoArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TacoCell", for: indexPath) as? TacoCell {
//            cell.configurecell(taco: ds.tacoArray[indexPath.row])
//            return cell
//        }
//        return UICollectionViewCell() //if if let is not successful, return uicollectionviewcell

        
//replaced code above and keeping up with reuse identifiers with code below. 
        let cell = collectionView.dequeueReusableCell(forindexPath: indexPath) as TacoCell
        cell.configurecell(taco: ds.tacoArray[indexPath.row])
        return cell
        

    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TacoCell {
            //if we are getting back a tacocell...any UIview will shake
            cell.shake()
        }
     
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 95)
    }
    
}
