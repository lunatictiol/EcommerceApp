//
//  Functions.swift
//  EcommerceApp
//
//  Created by sabiq on 20/02/24.
//

import Foundation
func ratings(rate:Double)->Int{
    switch rate{
    case 0.5...1 :
     return 1
    case 1..<1.5 :
     return 1
    case 1.5...2 :
    return 2
    case 2..<2.5 :
     return 2
    case 2.5...3 :
     return 3
    case 3..<3.5 :
     return 3
    case 3.5...4 :
     return 4
    case 4..<4.5 :
     return 4
    case 4.5...5 :
     return 5
    default:
        return 1
        
    }
    
    
}
