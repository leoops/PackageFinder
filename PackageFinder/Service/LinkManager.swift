//
//  linkManager.swift
//  TheNoticesGuardian
//
//  Created by Stefanini on 20/09/18.
//  Copyright © 2018 Stefanini. All rights reserved.
//

import Foundation

class LinkManager {

    private struct Path {
        static let file = "Services"
        static let type = "plist"
    }
    private struct Keys {
        static let events = "events"
    }
    
    private struct Tags {
        static let code = "<code>"
    }
   
    ///Concatena e retorna link a lista de seções com base na categoria da seção a ser exibida
    ///
    /// - Parameter showElements: categoria da seção
    /// - Returns: link da lista de seções
    static func listEventsOfPackage(withCode code: String) -> String {
        if let contentFile = contentOfFile(path: Path.file, type: Path.type), var link = contentFile[Keys.events] as? String {
            link = link.replacingOccurrences(of: Tags.code, with: code)
            return link
        }
        return ""
    }
    
    /// Metodo que recupera o conteudo de um arquivo
    ///
    /// - Parameters:
    ///   - path: nome do arquivo
    ///   - type: tipo
    /// - Returns: conteudo do arquivo
    static func contentOfFile(path: String, type: String) -> Dictionary<String,AnyObject>? {
        if let path = Bundle.main.path(forResource: path, ofType: type) {
            if let dictionary = NSDictionary(contentsOfFile: path) as? Dictionary<String,AnyObject> {
                return dictionary
            }
        }
        return nil
    }
}
