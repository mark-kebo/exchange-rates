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
    
    static let allCases: [String:String] = [CountryCodes.AUD.rawValue: L10n.Country.Key.aud,
                                            CountryCodes.BGN.rawValue: L10n.Country.Key.bgn,
                                            CountryCodes.BRL.rawValue: L10n.Country.Key.brl,
                                            CountryCodes.CAD.rawValue: L10n.Country.Key.cad,
                                            CountryCodes.CHF.rawValue: L10n.Country.Key.chf,
                                            CountryCodes.CNY.rawValue: L10n.Country.Key.cny,
                                            CountryCodes.CZK.rawValue: L10n.Country.Key.czk,
                                            CountryCodes.DKK.rawValue: L10n.Country.Key.dkk,
                                            CountryCodes.EUR.rawValue: L10n.Country.Key.eur,
                                            CountryCodes.GBP.rawValue: L10n.Country.Key.gbp,
                                            CountryCodes.HKD.rawValue: L10n.Country.Key.hkd,
                                            CountryCodes.HRK.rawValue: L10n.Country.Key.hrk,
                                            CountryCodes.HUF.rawValue: L10n.Country.Key.huf,
                                            CountryCodes.IDR.rawValue: L10n.Country.Key.idr,
                                            CountryCodes.ILS.rawValue: L10n.Country.Key.ils,
                                            CountryCodes.INR.rawValue: L10n.Country.Key.inr,
                                            CountryCodes.ISK.rawValue: L10n.Country.Key.isk,
                                            CountryCodes.JPY.rawValue: L10n.Country.Key.jpy,
                                            CountryCodes.KRW.rawValue: L10n.Country.Key.krw,
                                            CountryCodes.MXN.rawValue: L10n.Country.Key.mxn,
                                            CountryCodes.MYR.rawValue: L10n.Country.Key.myr,
                                            CountryCodes.NOK.rawValue: L10n.Country.Key.nok,
                                            CountryCodes.NZD.rawValue: L10n.Country.Key.nzd,
                                            CountryCodes.PHP.rawValue: L10n.Country.Key.php,
                                            CountryCodes.PLN.rawValue: L10n.Country.Key.pln,
                                            CountryCodes.RON.rawValue: L10n.Country.Key.ron,
                                            CountryCodes.RUB.rawValue: L10n.Country.Key.rub,
                                            CountryCodes.SEK.rawValue: L10n.Country.Key.sek,
                                            CountryCodes.SGD.rawValue: L10n.Country.Key.sgd,
                                            CountryCodes.THB.rawValue: L10n.Country.Key.thb,
                                            CountryCodes.USD.rawValue: L10n.Country.Key.usd,
                                            CountryCodes.ZAR.rawValue: L10n.Country.Key.zar]
}
