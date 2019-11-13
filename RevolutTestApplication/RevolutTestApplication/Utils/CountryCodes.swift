//
//  CountryCodes.swift
//  RevolutTestApplication
//
//  Created by Dmitry Vorozhbicki on 26/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import Foundation

enum CountryCodes: String {
    case AUD
    case BGN
    case BRL
    case CAD
    case CHF
    case CNY
    case CZK
    case DKK
    case EUR
    case GBP
    case HKD
    case HRK
    case HUF
    case IDR
    case ILS
    case INR
    case ISK
    case JPY
    case KRW
    case MXN
    case MYR
    case NOK
    case NZD
    case PHP
    case PLN
    case RON
    case RUB
    case SEK
    case SGD
    case THB
    case USD
    case ZAR
    
    static let allCases: [String:String] = [CountryCodes.AUD.rawValue: NSLocalizedString("country.key.AUD", comment: ""),
                                            CountryCodes.BGN.rawValue: NSLocalizedString("country.key.BGN", comment: ""),
                                            CountryCodes.BRL.rawValue: NSLocalizedString("country.key.BRL", comment: ""),
                                            CountryCodes.CAD.rawValue: NSLocalizedString("country.key.CAD", comment: ""),
                                            CountryCodes.CHF.rawValue: NSLocalizedString("country.key.CHF", comment: ""),
                                            CountryCodes.CNY.rawValue: NSLocalizedString("country.key.CNY", comment: ""),
                                            CountryCodes.CZK.rawValue: NSLocalizedString("country.key.CZK", comment: ""),
                                            CountryCodes.DKK.rawValue: NSLocalizedString("country.key.DKK", comment: ""),
                                            CountryCodes.EUR.rawValue: NSLocalizedString("country.key.EUR", comment: ""),
                                            CountryCodes.GBP.rawValue: NSLocalizedString("country.key.GBP", comment: ""),
                                            CountryCodes.HKD.rawValue: NSLocalizedString("country.key.HKD", comment: ""),
                                            CountryCodes.HRK.rawValue: NSLocalizedString("country.key.HRK", comment: ""),
                                            CountryCodes.HUF.rawValue: NSLocalizedString("country.key.HUF", comment: ""),
                                            CountryCodes.IDR.rawValue: NSLocalizedString("country.key.IDR", comment: ""),
                                            CountryCodes.ILS.rawValue: NSLocalizedString("country.key.ILS", comment: ""),
                                            CountryCodes.INR.rawValue: NSLocalizedString("country.key.INR", comment: ""),
                                            CountryCodes.ISK.rawValue: NSLocalizedString("country.key.ISK", comment: ""),
                                            CountryCodes.JPY.rawValue: NSLocalizedString("country.key.JPY", comment: ""),
                                            CountryCodes.KRW.rawValue: NSLocalizedString("country.key.KRW", comment: ""),
                                            CountryCodes.MXN.rawValue: NSLocalizedString("country.key.MXN", comment: ""),
                                            CountryCodes.MYR.rawValue: NSLocalizedString("country.key.MYR", comment: ""),
                                            CountryCodes.NOK.rawValue: NSLocalizedString("country.key.NOK", comment: ""),
                                            CountryCodes.NZD.rawValue: NSLocalizedString("country.key.NZD", comment: ""),
                                            CountryCodes.PHP.rawValue: NSLocalizedString("country.key.PHP", comment: ""),
                                            CountryCodes.PLN.rawValue: NSLocalizedString("country.key.PLN", comment: ""),
                                            CountryCodes.RON.rawValue: NSLocalizedString("country.key.RON", comment: ""),
                                            CountryCodes.RUB.rawValue: NSLocalizedString("country.key.RUB", comment: ""),
                                            CountryCodes.SEK.rawValue: NSLocalizedString("country.key.SEK", comment: ""),
                                            CountryCodes.SGD.rawValue: NSLocalizedString("country.key.SGD", comment: ""),
                                            CountryCodes.THB.rawValue: NSLocalizedString("country.key.THB", comment: ""),
                                            CountryCodes.USD.rawValue: NSLocalizedString("country.key.USD", comment: ""),
                                            CountryCodes.ZAR.rawValue: NSLocalizedString("country.key.ZAR", comment: "")]
}
