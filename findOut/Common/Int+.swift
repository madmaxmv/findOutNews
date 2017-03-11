//
//  Int+.swift
//  findOut
//
//  Created by Максим on 12/02/2017.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit

extension Int {
    private var daysInWeek: Int { return 7 }

    var dayOfWeek: String {
        if self < 0 { return "" }

        let rest = self % daysInWeek
        switch rest {
        case 0: return NSLocalizedString("DayOfWeek.saturday", comment: "суббота")
        case 1: return NSLocalizedString("DayOfWeek.sunday", comment: "воскресенье")
        case 2: return NSLocalizedString("DayOfWeek.monday", comment: "понедельник")
        case 3: return NSLocalizedString("DayOfWeek.tuesday", comment: "вторник")
        case 4: return NSLocalizedString("DayOfWeek.wednesday", comment: "среда")
        case 5: return NSLocalizedString("DayOfWeek.thursday", comment: "четверг")
        case 6: return NSLocalizedString("DayOfWeek.friday", comment: "пятница")
        default: return ""
        }
    }

    var inDayOfWeek: String {
        if self < 0 { return "" }

        let rest = self % daysInWeek
        switch rest {
        case 0: return NSLocalizedString("DayOfWeek.inSaturday", comment: "в субботу")
        case 1: return NSLocalizedString("DayOfWeek.inSunday", comment: "в воскресенье")
        case 2: return NSLocalizedString("DayOfWeek.inMonday", comment: "в понедельник")
        case 3: return NSLocalizedString("DayOfWeek.inTuesday", comment: "во вторник")
        case 4: return NSLocalizedString("DayOfWeek.inWednesday", comment: "в среду")
        case 5: return NSLocalizedString("DayOfWeek.inThursday", comment: "в четверг")
        case 6: return NSLocalizedString("DayOfWeek.inFriday", comment: "в пятницу")
        default: return ""
        }
    }

    func many(singleForm: String, manyForm: String) -> String {
        if self == 1 {
            return singleForm
        }
        return manyForm
    }

    func many(formsGroup: String) -> String {
        return many(singleForm: NSLocalizedString("\(formsGroup).single", comment: "форма для ед числа"),
                    manyForm: NSLocalizedString("\(formsGroup).many", comment: "форма для множественного числа"))
    }

    /// Подбирает нужну форму слова для числительного (для русской локали).
    func plural(_ form1: String, form2: String, form3: String? = nil) -> String {
        var form3val = form2
        if let form3 = form3 {
            form3val = form3
        }
        var number = self % 100
        if number >= 11 && number <= 19 {
            return form3val
        }

        number = number%10
        switch number {
        case 1:
            return form1
        case 2, 3, 4:
            return form2
        default:
            return form3val
        }
    }

    func plural(forFormsGroup formsGroup: String) -> String {
        let form1 = NSLocalizedString("\(formsGroup).form1", comment: "единичная форма")
        let form2 = NSLocalizedString("\(formsGroup).form2", comment: "краткая множественная форма")
        let form3 = NSLocalizedString("\(formsGroup).form3", value: form2, comment: "полная множественная форма")
        return plural(form1, form2: form2, form3: form3)
    }

    func plural(forFormsGroup formsGroup: String, withSingleValue singleValue: Bool = true) -> String {
        var result = ""
        if singleValue || self > 1 {
            result += "\(self) "
        }
        result += plural(forFormsGroup: formsGroup)
        return result
    }

    func plural(forFormsGroup formsGroup: String, withValueForDetails valueForDetails: Bool = true) -> NSAttributedString {
        var result = ""
        if valueForDetails || self > 1 {
            result += "\(self) "
        }

        let resultString = NSMutableAttributedString(string: result, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 21)])

        let places = NSAttributedString(string: plural(forFormsGroup: formsGroup),
                                        attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)])
        resultString.append(places)
        return resultString
    }
}
