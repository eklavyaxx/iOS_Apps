//
//  Home.swift
//  Snacks
//
//  Created by Eklavya Mishra on 26/08/24.
//

import SwiftUI

struct Home: View {
    
    // Catagory View Properties
    @State var selectedCatagory =  "Choco"
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Header
                    HStack {
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size : 36))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    // Catagory List
                    CatagoryListView
                    
                    // Collection View
                    HStack{
                        Text("Choco **Collecttions**")
                            .font(.system(size: 24))
                        
                            Spacer()
                        
                        NavigationLink{
                            CollectionView()
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                            .imageScale(.large)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    // Product List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(ProductList, id: \.id) { item in
                                ProductCard(product: item)
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    // Catagory List View
    
    var CatagoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(catagoryList, id: \.id) { item in
                        Button {
                            selectedCatagory = item.title
                        } label: {
                            HStack {
                                if item.title != "All" {
                                    Image(item.icon)
                                        .foregroundColor(selectedCatagory == item.title ? .yellow : .black)
                                }
                                
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCatagory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCatagory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal,30)
            }
                                
        }
    }
}

#Preview {
    Home()
        .environmentObject(CartManager())
}

// Product Card View

struct ProductCard : View {
    
    var product : Product
    
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
        ZStack {
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
                

            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.system(size: 36, weight: .semibold))
                    .frame(width: 180)
                Text(product.catagory)
                    .font(.callout)
                    .padding()
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                
                Spacer()
                
                HStack{
                    Text("$\(product.price).0")
                        .font(.system(size: 26, weight: .semibold))
                    Spacer()
                    
                    Button{
                        cartManager.addToCart(product: product)
                    } label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width: 90, height: 68)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, -10)
                }
                .padding(.leading)
                .padding()
                
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.white.opacity(0.7))
                .clipShape(Capsule())
                
            })
            
            
        }
        .padding(30)
        .frame(width: 336, height: 422)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 20)
    }
}
