//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Jeffrey Viramontes on 9/26/23.
//

import Foundation

extension String{
    func capitalizeFirstLeatter() -> String {
        return self.prefix(1).uppercased()+self.lowercased().dropFirst()
    }
}
