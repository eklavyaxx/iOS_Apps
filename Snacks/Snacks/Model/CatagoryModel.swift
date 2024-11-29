//
//  CatagoryModel.swift
//  Snacks
//
//  Created by Eklavya Mishra on 26/08/24.
//

import SwiftUI

struct CatagoryModel: Identifiable, Hashable {
    
    var id: UUID = .init ()
    var icon : String
    var title : String
    
}

var catagoryList: [CatagoryModel] = [
    CatagoryModel(icon: "", title: "All"),
    CatagoryModel(icon: "choco", title: "Choco"),
    CatagoryModel(icon: "waffle", title: "Waffles"),
    CatagoryModel(icon: "toffee", title: "Toffee"),
]
