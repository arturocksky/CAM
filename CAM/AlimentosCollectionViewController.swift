//
//  AlimentosCollectionViewController.swift
//  CAM
//
//  Created by Arturo on 8/27/18.
//  Copyright © 2018 cam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

private let reuseIdentifier = "reuseIdentifier"
private var x = 0
private var y = 0
//private let user = Auth.auth().currentUser?.uid


class AlimentosCollectionViewController: UICollectionViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    var ref: DatabaseReference!
    var user: String = "anonimo"
    var color: CGColor = UIColor.white.cgColor
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 99
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "$ \(row)"
        } else  {
            return ". \(row)"
        }
    }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            
            x = row
          //  return "$ \(row)"
        } else  {
            y = row
           // return ". \(row)"
        }
        
    }
    
    
    let Alimentos:[String] = ["Tomate Verde","Zanahoria","Calabacita","Papa Blanca","Aguacate Hass","Lechuga Romana","Lechuga Orejona","Cebolla Blanca","Chile Serrano","Jitomate Saladette","Limon sin Semilla","Chicharo","Ejote","Pepino","Chile Poblano","Naranja","Piña","Papaya","Platano Tabasco","Manzana","Higado de Res","Bistec de Res","Retazo de Res","Pollo Entero","Pechuga de Pollo","Pierna con Muslo","Retazo de Pollo Maciza-Pierna","Pescado Sierra","Lentejas","Frijol Bayo","Arroz","Sopa de Pasta","Aceite","Sardina","Atun en Agua o Aceite","Sal Refinada","Azucar Estandar","Cafe","Leche Pasteurizada","Leche Liconsa","Queso Blanco","Agua","Pan Dulce","Bolillo","Tortilla de Maiz","Nopales","Huevo"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
       ref = Database.database().reference()
        if let currentUser = Auth.auth().currentUser?.uid {
            user = currentUser
            
            
        }
        
        
        

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
        cell.layer.borderWidth = 0.0
        cell.layer.cornerRadius = 4 // optional
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0.0,height: 1.0)
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
         cell.layer.backgroundColor = color

    
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem (at: indexPath)as! AlimentoCollectionViewCell
        
        let image = UIImage (named: "\(Alimentos[indexPath.row])L.png")
        let w = Alimentos[indexPath.row]
        
               
        let alertView = UIAlertController(
            title: Alimentos[indexPath.row],
            message: "\n\n\n\n\n\n\n\n",
            preferredStyle: .alert)
        
       // image?.draw(in: CGRect(x: 20, y: 70, width:100 , height: 100))
      
        alertView.addImage(image: image!)
        
        let pickerView = UIPickerView(frame:
            CGRect(x: 0, y: 50, width: 260, height: 162))
       
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // comment this line to use white color
        pickerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
    //    pickerView.numberOfRows(inComponent: 2)
        
      //  pickerView.view(forRow: 1, forComponent: 1)
        
        alertView.view.addSubview(pickerView)
        
        
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            //print("ACTION 1 selected!")
            print("Alimento", self.Alimentos[indexPath.row])
           // print("Seleccion", self.pickerView(pickerView, titleForRow: x , forComponent: indexPath.row) as Any)
           // print("Seleccion", x)
            // print("Seleccion", y)
            // self.color = UIColor.black.cgColor
            let nuevo = ["alimento": w,"pesos": x, "centavos": y] as [String : Any]
            self.ref.child("users").child(self.user).updateChildValues(nuevo)
          //  self.cell.outLabelAlimento.text = Alimentos[indexPath.row]
            
           //
            cell.layer.backgroundColor = UIColor.green.cgColor
            cell.outLabelAlimento.text = "$" + String(x) + "." + String(y)
            
        })
        
       
        
        alertView.addAction(action)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertView.addAction(cancelAction)
       // present(alertView, animated: true, completion: { _ in pickerView.frame.size.width = alertView.view.frame.size.width
        self.parent!.present(alertView, animated: true)
        
        /*
        let alert = UIAlertController(title: "Picker View", message: "Hi", preferredStyle: .actionSheet)
        
        alert.isModalInPopover = true
        
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width:  300, height: 90)) // CGRectMake(left, top, width, height) - left and top are like margins
        pickerFrame.tag = 555
        //set the pickers datasource and delegate
        pickerFrame.delegate = self
        //pickerFrame.numberOfRows(inComponent: 1)
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
        self.parent!.present(alert, animated: true)  */
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
     //   let cell = collectionView.cellForItem (at: indexPath)
       // cell?.layer.backgroundColor = UIColor.white.cgColor
        //self.color = UIColor.black.cgColor
        
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
