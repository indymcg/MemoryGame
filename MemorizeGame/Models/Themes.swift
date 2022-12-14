//
//  Themes.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 9/1/22.
//

import Foundation

struct Theme {
    var name: String
    var color: String
    var emojis: [String]
        
    init(name: String, color: String, emojis: [String]) {
        self.name = name
        self.color = color
        self.emojis = emojis
    }
}

enum availableThemes: CaseIterable {
    case halloween, party, underTheSea
}

func getTheme(theme: availableThemes) -> Theme {
    switch theme {
        case .halloween:
        return Theme(name: "Halloween", color: "HalloweenColor", emojis: ["π", "π", "π»", "π§π»ββοΈ", "π§", "πΈ", "π·", "π¦΄","π", "π", "π»", "π§π»ββοΈ", "π§", "πΈ", "π·", "π¦΄", "π§πΌββοΈ", "π§πΌββοΈ", "π¦", "π¦"].shuffled())
        case .party:
        return Theme(name: "Party", color: "PartyColor", emojis: ["π", "π", "π₯³", "π", "π", "π", "πΎ", "πͺ©", "πͺ", "π", "π₯³", "π", "π", "π", "πΎ", "πͺ©", "πͺ", "π", "πΊπ»", "πΊπ»"].shuffled())
        case .underTheSea:
            return Theme(name: "Under the Sea", color: "OceanColor", emojis: ["π ", "π¦", "π", "π¬", "π¦", "π‘", "π", "π³", "π", "π§π½ββοΈ", "π ", "π¦", "π", "π¬", "π¦", "π‘", "π", "π³", "π", "π§π½ββοΈ"].shuffled())
    }
}

