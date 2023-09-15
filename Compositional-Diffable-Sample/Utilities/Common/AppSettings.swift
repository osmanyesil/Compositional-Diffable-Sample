//
//  AppSettings.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 15.09.2023.
//

import Foundation

struct AppSettings {
    
    enum Environment {
        case debug, release
    }
    
    static var environment: Environment {
        #if DEBUG
            return .debug
        #elseif RELEASE
            return .release
        #else
            return .debug
        #endif
    }
    
    static var baseAPIURL: String = "https://fakestoreapi.com/"
}
