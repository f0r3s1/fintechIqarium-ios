//
//  SettingsRow.swift
//  fintech
//
//  Created by Jerry Polyansky on 09.07.2022.
//

import Foundation

enum SettingsRowType: Int {
    case empty
    case recomendation
    case lowCost
    case routine
    case sale
    case recipes
}

struct SettingsRow: Hashable, Codable, Identifiable {
    let id: Int
    let idtype: Int
    let imageName: String
    let title: String
    let description: String

    static func settings() -> [SettingsRow] {
        return [.init(id: 0, idtype: SettingsRowType.empty.rawValue,
                      imageName: "",
                      title: "Тут что-то про банк",
                      description: "Что-то не очень важное"),
                .init(id: 1, idtype: SettingsRowType.empty.rawValue,
                      imageName: "",
                      title: "Здесь тоже что-то есть",
                      description: "Чуть по важнее чем выше"),
                .init(id: 2, idtype: SettingsRowType.recomendation.rawValue,
                      imageName: "",
                      title: "Рекомендации",
                      description: "Самый важный пункт"),
                .init(id: 3, idtype: SettingsRowType.empty.rawValue,
                      imageName: "",
                      title: "Какой-то пункт банка",
                      description: "Пустота"),
        ]
    }

    static func optimisation() -> [SettingsRow] {
        return [.init(id: 0, idtype: SettingsRowType.lowCost.rawValue,
                      imageName: "sale",
                      title: "Нашли дешевле",
                      description: "А ты нет"),
                .init(id: 1, idtype: SettingsRowType.routine.rawValue,
                      imageName: "bubbles",
                      title: "Избавься от рутины",
                      description: "Насовсем"),
                .init(id: 2, idtype: SettingsRowType.sale.rawValue,
                      imageName: "percent",
                      title: "Анализ акций",
                      description: "Как в Едадил"),
                .init(id: 3, idtype: SettingsRowType.recipes.rawValue,
                      imageName: "delishes",
                      title: "Рецепты",
                      description: "Возьмем сперва укропу"),
        ]
    }
}
