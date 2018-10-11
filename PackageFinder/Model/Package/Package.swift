//
//  Sessao.swift
//  TheNoticesGuardian
//
//  Created by Stefanini on 18/09/18.
//  Copyright © 2018 Stefanini. All rights reserved.
//

import Foundation
import SwiftyJSON


class Package {
    var results = [Event]()
    typealias EventHandler = (([Event]) -> ())
    typealias ErrorHandler = ((String) -> ())
    
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    public required init(json: JSON) {
        if let results = json.array { self.results = results.map{ Event(json: $0)}}
    }
    public init() {
        
    }
}
extension Package {
    func getPackage(withCode code: String, handler: EventHandler?, errorHandler: @escaping ErrorHandler) {
        let url = LinkManager.listEventsOfPackage(withCode: code)
        
        ApiService().resquest(url: url, handler: { (result) in
            if let result = result {
                let package = Package(object: result)
                if let handlerUnwrapped = handler {
                    handlerUnwrapped(package.results)
                }
            }
        }, errorHandler: { (error) in
            if error != "" {
                errorHandler(error)
            }
        })
    }
}
