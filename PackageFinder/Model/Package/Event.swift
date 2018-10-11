//
//  ObjectPackage.swift
//  PackageFinder
//
//  Created by Stefanini on 11/10/18.
//  Copyright © 2018 Stefanini. All rights reserved.
//

import Foundation
import SwiftyJSON


class Event {
    
    private struct SerializationKey {
        static let data = "data"
        static let hora = "hora"
        static let local = "local"
        static let status = "status"
    }
    //    "data": "10/10/2018",
    //    "hora": "10:46",
    //    "local": "Viamao / RS",
    //    "status": "Objeto entregue ao destinatário"
    
    let data: String?
    let hora: String?
    let local: String?
    let status: String?
    
    public required init(json: JSON) {
        self.data  = json[SerializationKey.data].string
        self.hora  = json[SerializationKey.hora].string
        self.local  = json[SerializationKey.local].string
        self.status  = json[SerializationKey.status].string
    }
    
    public init(data: String, hora: String, local: String, status: String){
        self.data = data
        self.hora = hora
        self.local = local
        self.status = status
    }
}

