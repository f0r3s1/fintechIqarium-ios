//
//  ContentView.swift
//  fintech
//
//  Created by Jerry Polyansky on 09.07.2022.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var rows: [SettingsRow]
    
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
        List(rows) { row in
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 4)
                NavigationLink {
                    let type = SettingsRowType.init(rawValue: row.idtype)!
                    
                    if type == .recomendation {
                        RecommendView()
                    } else if type == .lowCost {
                        LowCostView(rows: CostRow.sales())
                    }
                } label: {
                    ZStack (alignment: .leading) {
                        HStack (spacing: 25) {
                            Image(row.imageName)
                                .frame(width: 50, height: 50, alignment: .leading)
                                .padding(.leading, -8)
                            
                            VStack (alignment: .leading, spacing: 3) {
                                Text(row.title)
                                    .font(.subheadline)
                                Text(row.description)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }.padding(EdgeInsets.init(top: 8, leading: 8, bottom: 8, trailing: 8))
                
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(rows: SettingsRow.settings())
            .previewDevice("iPhone 13 mini")
    }
}
