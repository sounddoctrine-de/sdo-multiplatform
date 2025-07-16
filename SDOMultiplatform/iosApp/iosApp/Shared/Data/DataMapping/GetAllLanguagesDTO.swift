//
//  GetAllLanguagesDTO.swift
//  SDO
//
//  Created by Joel Kingsley on 04/11/2022.
//

import Foundation

extension GetAllLanguagesQuery.Data {
    func toEntity() -> [LanguageData] {
        language.map { language in
            LanguageData(
                languageCode: language.languageCode,
                sourceCountryFlag: language.sourceCountryFlag
            )
        }
    }
}
