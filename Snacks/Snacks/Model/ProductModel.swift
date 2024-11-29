//
//  ProductModel.swift
//  Snacks
//
//  Created by Eklavya Mishra on 26/08/24.
//

import SwiftUI

// Product Model
struct Product: Identifiable {
    var id: UUID = .init()
    var name : String
    var catagory: String
    var image: String
    var color: Color
    var price: Int
}

// Sample Products

var ProductList = [
    Product(name: "Oreo Chocolate Bar", catagory: "Choco", image: "image 1",color: .pink, price: 8),
    Product(name: "Hershey's", catagory: "Choco", image: "image 2",color: .yellow, price: 8),
    Product(name: "Salt & Vinegar", catagory: "Chips", image: "image 3",color: .red, price: 8),
    Product(name: "Sour Cream & Onion", catagory: "Chips", image: "image 4",color: .green,price: 8),
    Product(name: "Cheddar & Sour Cream", catagory: "Chips", image: "image 5",color: .blue, price: 8),
    Product(name: "Doritos Nacho Cheese", catagory: "Chips", image: "image 6",color: .brown, price: 8),
    Product(name: "Cheetos Crunchy", catagory: "Chips", image: "image 7",color: .orange, price: 8),
    Product(name: "M&M's Chocolate Candy", catagory: "toffee", image: "image 8",color: .purple, price: 8),
    
]
