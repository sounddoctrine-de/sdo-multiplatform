//
//  LanguageData.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

struct LanguageData: Identifiable, Hashable {
    var id: UUID {
        UUID(uuidString: languageCode) ?? UUID()
    }
    
    let languageCode: String
    let sourceCountryFlag: String
    
    var languageName: String {
        return Locale.current.localizedString(
            forLanguageCode: languageCode
        ) ?? String(localized: String.LocalizationValue("searchResultsLanguageNoneLabel"))
    }
}

extension LanguageData {
    /// Represents a language selection of none
    init() {
        self.init(languageCode: "", sourceCountryFlag: "")
    }
}
