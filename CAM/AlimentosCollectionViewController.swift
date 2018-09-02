//
//  AlimentosCollectionViewController.swift
//  CAM
//
//  Created by Arturo on 8/27/18.
//  Copyright © 2018 cam. All rights reserved.
//

import UIKit

private let reuseIdentifier = "reuseIdentifier"

class AlimentosCollectionViewController: UICollectionViewController, UIPickerViewDelegate{
    
    let Alimentos:[String] = ["Tomate Verde","Zanahoria","Calabacita","Papa Blanca","Aguacate Hass","Lechuga Romana","Lechuga Orejona","Cebolla Blanca","Chile Serrano","Jitomate Saladette","Limon sin Semilla","Chicharo","Ejote","Pepino","Chile Poblano","Naranja","Piña","Papaya","Platano Tabasco","Manzana","Higado de Res","Bistec de Res","Retazo de Res","Pollo Entero","Pechuga de Pollo","Pierna con Muslo","Retazo de Pollo Maciza-Pierna","Pescado Sierra","Lentejas","Frijol Bayo","Arroz","Sopa de Pasta","Aceite","Sardina","Atun en Agua/Aceite","Sal Refinada","Azucar Estandar","Cafe","Leche Pasteurizada","Leche Liconsa","Queso Blanco","Agua","Agua","Pan Dulce","Bolillo","Tortilla de Maiz","Jabon de Tocador","Detergente en Polvo","Nopales","Huevo","Papel Higienico"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Alimentos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AlimentoCollectionViewCell
        
        cell.outLabelAlimento.text = Alimentos[indexPath.row]
        cell.outImageAlimento.image = UIImage(named: "\(Alimentos[indexPath.row]).png")
        // Configure the cell
        
        // add a border
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8 // optional
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath

    
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Picker View", message: "Hi", preferredStyle: .actionSheet)
        
        alert.isModalInPopover = true
        
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width:  300, height: 90)) // CGRectMake(left, top, width, height) - left and top are like margins
        pickerFrame.tag = 555
        //set the pickers datasource and delegate
        pickerFrame.delegate = self
       // pickerFrame.numberOfRows(inComponent: 5)
        //pickerFrame.setValuesForKeys(["hi" : 1])
        
        //Add the picker to the alert controller
        alert.view.addSubview(pickerFrame)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            //Perform Action
        })
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        self.parent!.present(alert, animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionReusableView", for: indexPath) 
            // do any programmatic customization, if any, here
            return view
        }
        fatalError("Unexpected kind")
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
