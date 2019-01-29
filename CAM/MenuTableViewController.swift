//
//  MenuTableViewController.swift
//  CAM
//
//  Created by Arturo on 8/14/18.
//  Copyright © 2018 cam. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    let options:[String] = ["Inicio","Mi perfil","Mis Cuestionarios","Resultados en el Sitio CAM","Aviso de Privacidad"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let container = self.so_containerViewController {
            container.isSideViewControllerPresented = false
            if indexPath.row == 0 {
                container.topViewController = self.storyboard?.instantiateViewController(withIdentifier: "inicio")
                container.title = "Inicio"
            }
            else if indexPath.row == 1{
                container.topViewController = self.storyboard?.instantiateViewController(withIdentifier: "perfil")
                container.title = "Mi Perfil"
            }
            else if indexPath.row == 3 {
                container.topViewController = self.storyboard?.instantiateViewController(withIdentifier: "resultados")
                container.title = "Resultados CAM"
            }
            else if indexPath.row == 2 {
                container.topViewController = self.storyboard?.instantiateViewController(withIdentifier: "cuestionarios")
                container.title = "Mis Cuestionarios"
            }
            else if indexPath.row == 4 {
                container.topViewController = self.storyboard?.instantiateViewController(withIdentifier: "privacidad")
                container.title = "Aviso de Privacidad"
            }
        }
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
