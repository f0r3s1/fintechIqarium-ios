//
//  RecommendRow.swift
//  fintech
//
//  Created by Jerry Polyansky on 09.07.2022.
//

import Foundation

enum RecommendRowType: Int {
    case optimisation
    case notifications
}

struct RecommendRow: Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
    let imageName: String
    let type: RecommendRowType
    
    static func mock() -> [RecommendRow] {
        return [.init(id: 0,
                      title: "Больше осознанности",
                      description: "Тратьте меньше,\nэкономьте больше.\nА мы вам поможем",
                      imageName: "wallet",
                      type: .optimisation),
                .init(id: 1,
                      title: "Напоминания",
                      description: "Чтобы ничего не пропустить,\nотличные скидки и предложения",
                      imageName: "big_notification",
                      type: .notifications),
        ]
    }
}
