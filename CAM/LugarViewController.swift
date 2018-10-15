//
//  LugarViewController.swift
//  CAM
//
//  Created by oqtubre on 14/10/18.
//  Copyright © 2018 cam. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LugarViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var losEstados:[[String:Any]]=[]
    var losMunicipiosFiltrados:[[String:Any]]=[]
    var pickerEstados = UIPickerView()
    var pickerMunicipios = UIPickerView()
    var user: String = "anonimo"
    var ref: DatabaseReference!
    var lugar: String = ""
    
    @IBOutlet weak var btnSeleccionarLugar: UISegmentedControl!
    @IBOutlet weak var txtEstado: UITextField!
    @IBOutlet weak var txtMunicipio: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerEstados.delegate = self
        pickerEstados.dataSource = self
        pickerMunicipios.delegate = self
        pickerMunicipios.dataSource = self
        txtEstado.inputView = pickerEstados
        txtMunicipio.inputView = pickerMunicipios
        ref = Database.database().reference()
        
        if let currentUser = Auth.auth().currentUser?.uid {
            user = currentUser
        }
        
        if let path = Bundle.main.url(forResource:"estados", withExtension:"json") {
            do {
                let bytes = try Data(contentsOf: path)
                let tmp = try JSONSerialization.jsonObject(with: bytes, options: JSONSerialization.ReadingOptions.allowFragments)
                losEstados = tmp as! [[String:Any]]
            }
            catch {
                print("error al procesar el json estados")
            }
        }
        
        filtrarMunicipios(estado: 0)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countRows:Int = losMunicipiosFiltrados.count
        if pickerView == pickerEstados{
            countRows = losEstados.count
        }
        return countRows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView==pickerEstados{
            let infoestado = losEstados[row]
            let etiquetaEstado = infoestado["NOM_ESTADO"] as! String
            return etiquetaEstado
        }else if pickerView==pickerMunicipios{
            let infomunicipio = losMunicipiosFiltrados[row]
            let etiquetaMunicipio = infomunicipio["NOM_MUN"] as! String
            return etiquetaMunicipio
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView==pickerEstados{
            filtrarMunicipios(estado: row)
            pickerMunicipios.selectRow(0, inComponent: 0, animated: true)
            txtMunicipio.text = "Selecciona un municipio"
            self.pickerMunicipios.reloadAllComponents()
            let infoestado = losEstados[row]
            let etiquetaEstado = infoestado["NOM_ESTADO"] as! String
            txtEstado.text = etiquetaEstado
        }else if pickerView==pickerMunicipios{
            let infomunicipio = losMunicipiosFiltrados[row]
            let etiquetaMunicipio = infomunicipio["NOM_MUN"] as! String
            txtMunicipio.text = etiquetaMunicipio
        }
    }
    
    @IBAction func btnLugarSiguiente(_ sender: UIButton) {
        switch btnSeleccionarLugar.selectedSegmentIndex {
        case 1:
            lugar = "Mercado"
        case 0:
            lugar = "Supermercado"
        default:
            lugar = "Tianguis"
        }
        
        let id = ref.childByAutoId().key
        let campos = [
            "ID":id,
            "Estado": txtEstado.text!,
            "Municipio": txtMunicipio.text!,
            "Lugar": lugar]
        
        
        if let etiquetaEstado:String = txtEstado.text {
            if let etiquetaMunicipio:String = txtMunicipio.text {
                print("El lugar donde se levantó fue en el \(lugar). El estado es \(etiquetaEstado) y el municipio es \(etiquetaMunicipio)")
                ref.child("Precios").child(user).setValue(campos)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func filtrarMunicipios(estado:Int) {
        let infoestado = losEstados[estado]
        losMunicipiosFiltrados = infoestado["MUNICIPIOS"] as! [[String : Any]]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
