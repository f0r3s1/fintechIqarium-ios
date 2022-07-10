//
//  RecommendView.swift
//  fintech
//
//  Created by Jerry Polyansky on 09.07.2022.
//

import SwiftUI

struct RecommendView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let rows: [RecommendRow] = RecommendRow.mock()
    
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
        List {
            ForEach(rows) { row in
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(5)
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 4)
                    NavigationLink {
                        switch row.type {
                        case .optimisation:
                            SettingsView(rows: SettingsRow.optimisation())
                        case .notifications:
                            RecommendView()
                        }
                    } label: {
                        VStack (alignment: .leading, spacing: 12) {
                            Spacer()
                            Text(row.title)
                                .font(.subheadline)
                            Text(row.description)
                                .font(.caption2)
                                .foregroundColor(.gray)
                            Spacer()
                            Spacer()
                        }
                        .padding()
                    }.padding(EdgeInsets.init(top: 8, leading: 8, bottom: 8, trailing: 8))
                    
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Image(row.imageName)
                                .padding(.trailing, -14)
                                .padding(.bottom, 14)
                        }
                    }
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
            
        }
        .navigationBarTitle("Рекомендации")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendView()
    }
}
