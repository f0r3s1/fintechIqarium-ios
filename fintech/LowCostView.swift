//
//  LowCostView.swift
//  fintech
//
//  Created by Jerry Polyansky on 10.07.2022.
//

import SwiftUI

struct LowCostView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var rows: [CostRow]
    
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("back_button")
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
    
    var body: some View {
        List (rows) { row in
            ZStack (alignment: .leading) {
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 4)
                HStack (spacing: 25) {
                    
                    ZStack (alignment: .leading) {
                        Rectangle().fill(Color.init(red: 230/255, green: 230/255, blue: 230/255, opacity: 1.0))
                        VStack {
                            Text("Вы покупаете:")
                                .padding()
                            ZStack {
                                HStack {
                                    Image(row.oldProduct.magImageName)
                                    VStack (alignment: .leading, spacing: 3) {
                                        Text(row.oldProduct.magName)
                                            .font(.subheadline)
                                        Text(row.oldProduct.productName)
                                            .font(.headline)
                                    }
                                }.padding(.bottom, 16)
                                
                                
                            }
                            Text("Мы предлагаем:")
                                .padding()
                            HStack {
                                Rectangle()
                                    .frame(width: 50, height: 50, alignment: .leading)
                                    .padding(.leading, 16)
                                VStack (alignment: .leading, spacing: 3) {
                                    Text(row.oldProduct.magName)
                                        .font(.subheadline)
                                    Text(row.oldProduct.productName)
                                        .font(.headline)
                                }
                            }.padding(.bottom, 16)
                        }
                    }
                    
                    //                            Image(row.imageName)
                    
                }
                .padding(EdgeInsets.init(top: 8, leading: 8, bottom: 8, trailing: 8))
            }
            
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
        }
        .navigationBarTitle("Информация")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct LowCostView_Previews: PreviewProvider {
    static var previews: some View {
        LowCostView(rows: CostRow.sales())
//        LowCostView(rows: SettingsRow.settings())
    }
}

struct Product: Hashable, Codable, Identifiable {
    let id: Int
    let magImageName: String
    let magName: String
    let productName: String
    let price: Int
}

struct CostRow: Hashable, Codable, Identifiable {
    let id: Int
    let oldProduct: Product
    let newProduct: Product
    
    static func sales() -> [CostRow] {
        return [.init(id: 0,
                      oldProduct: .init(id: 0,
                                        magImageName: "magnit_small",
                                        magName: "Магнит",
                                        productName: "Яйцо куриное",
                                        price: 120),
                      newProduct: .init(id: 1,
                                        magImageName: "five_small",
                                        magName: "Пятерочка",
                                        productName: "Яйцо куриное",
                                        price: 90))]
    }
}
