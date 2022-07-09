//
//  SettingsRow.swift
//  fintech
//
//  Created by Jerry Polyansky on 09.07.2022.
//

import Foundation

struct SettingsRow: Hashable, Codable, Identifiable {
    let id: Int
    let imageName: String
    let title: String
    let description: String
    
    static func mock() -> [SettingsRow] {
        return [.init(id: 0,
                      imageName: "",
                      title: "Тут что-то про банк",
                      description: "Что-то не очень важное"),
                .init(id: 1,
                      imageName: "",
                      title: "Здесь тоже что-то есть",
                      description: "Чуть по важнее чем выше"),
                .init(id: 2,
                      imageName: "",
                      title: "Рекомендации",
                      description: "Самый важный пункт"),
                .init(id: 3,
                      imageName: "",
                      title: "Какой-то пункт банка",
                      description: "Пустота"),
        ]
    }
}
