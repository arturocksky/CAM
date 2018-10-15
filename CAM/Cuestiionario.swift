//
//  Cuestiionario.swift
//  CAM
//
//  Created by oqtubre on 15/10/18.
//  Copyright © 2018 cam. All rights reserved.
//

import Foundation

class Cuestionario {
    var estado:String?
    var municipio:String?
    var lugar:String?
    
    init(estado:String?, municipio:String?, lugar:String?) {
        self.estado = estado
        self.municipio = municipio
        self.lugar = lugar
    }
}
