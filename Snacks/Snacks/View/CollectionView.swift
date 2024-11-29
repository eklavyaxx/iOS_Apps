//
//  CollectionView.swift
//  Snacks
//
//  Created by Eklavya Mishra on 27/08/24.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    HStack {
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size : 30))
                            .padding(.trailing)
                        
                        Spacer()
                         
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            
                            
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 60, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundColor(.black)
                    }
                    .padding(30)
                    
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],
                        content: {
                        ForEach(ProductList,id: \.id) { item in
                            SmallProductCard(product: item)
                                .environmentObject(cartManager)
                        }
                        .padding(.horizontal)
                    })
                }
            }
        }
    }
}

#Preview {
    CollectionView()
        .environmentObject(CartManager())
    
    
}
// Small Product Card

struct SmallProductCard: View {
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
            ZStack {
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size:10))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                Spacer()
                
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size:14, weight: .semibold))
                        Spacer()
                        
                        Button{
                            cartManager.addToCart(product: product)
                        }label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45, height: 40)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing, -12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                })
            }
            .padding(20)
            .frame(width: 170, height: 215)
        }
        .frame(width: 170, height: 215)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.leading,10)
    }
}
