//
//  ContentView.swift
//  fintech
//
//  Created by Jerry Polyansky on 09.07.2022.
//

import SwiftUI

struct SettingsView: View {
    
    let rows = SettingsRow.mock()
    
    var body: some View {
        NavigationView {
            List(rows) { row in
                ZStack (alignment: .leading) {
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(5)
                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 4)
                        
                    HStack {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 50, height: 50, alignment: .leading)
                            .padding(EdgeInsets.init(top: 8, leading: 8, bottom: 8, trailing: 0))
                        
                        VStack (alignment: .leading, spacing: 3) {
                            Text(row.title)
                                .font(.subheadline)
                            Text(row.description)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
            }
            
            .navigationTitle("Типа банк")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewDevice("iPhone 13 mini")
    }
}
