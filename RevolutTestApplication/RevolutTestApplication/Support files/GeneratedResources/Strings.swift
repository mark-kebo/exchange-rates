// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum AddScreen {
    internal enum Button {
      /// Add currency pair
      internal static let addPair = L10n.tr("Localizable", "addScreen.button.addPair")
    }
    internal enum Label {
      /// Choose a currency pair to compare their live rates
      internal static let addPair = L10n.tr("Localizable", "addScreen.label.addPair")
    }
  }

  internal enum Alert {
    /// Currency pair already exists
    internal static let currencyPairAlreadyExists = L10n.tr("Localizable", "alert.currencyPairAlreadyExists")
  }

  internal enum Country {
    internal enum Key {
      /// Australian Dollar
      internal static let aud = L10n.tr("Localizable", "country.key.AUD")
      /// Bulgarian Lev
      internal static let bgn = L10n.tr("Localizable", "country.key.BGN")
      /// Brazilian Real
      internal static let brl = L10n.tr("Localizable", "country.key.BRL")
      /// Canada Dollar
      internal static let cad = L10n.tr("Localizable", "country.key.CAD")
      /// Swiss Franc
      internal static let chf = L10n.tr("Localizable", "country.key.CHF")
      /// Chinese Yuan
      internal static let cny = L10n.tr("Localizable", "country.key.CNY")
      /// Czech Koruna
      internal static let czk = L10n.tr("Localizable", "country.key.CZK")
      /// Danish Krone
      internal static let dkk = L10n.tr("Localizable", "country.key.DKK")
      /// Euro
      internal static let eur = L10n.tr("Localizable", "country.key.EUR")
      /// Pound Sterling
      internal static let gbp = L10n.tr("Localizable", "country.key.GBP")
      /// Hong Kong Dollar
      internal static let hkd = L10n.tr("Localizable", "country.key.HKD")
      /// Croatian Kuna
      internal static let hrk = L10n.tr("Localizable", "country.key.HRK")
      /// Hungarian Forint
      internal static let huf = L10n.tr("Localizable", "country.key.HUF")
      /// Indonesian Rupiah
      internal static let idr = L10n.tr("Localizable", "country.key.IDR")
      /// Israeli Shekel
      internal static let ils = L10n.tr("Localizable", "country.key.ILS")
      /// Indian Rupee
      internal static let inr = L10n.tr("Localizable", "country.key.INR")
      /// Icelandic Krona
      internal static let isk = L10n.tr("Localizable", "country.key.ISK")
      /// Japanese Yen
      internal static let jpy = L10n.tr("Localizable", "country.key.JPY")
      /// South Korean Won
      internal static let krw = L10n.tr("Localizable", "country.key.KRW")
      /// Mexican Peso
      internal static let mxn = L10n.tr("Localizable", "country.key.MXN")
      /// Malaysian Ringgit
      internal static let myr = L10n.tr("Localizable", "country.key.MYR")
      /// Norwegian Krone
      internal static let nok = L10n.tr("Localizable", "country.key.NOK")
      /// New Zealand Dollar
      internal static let nzd = L10n.tr("Localizable", "country.key.NZD")
      /// Philippine Peso
      internal static let php = L10n.tr("Localizable", "country.key.PHP")
      /// Polish Zloty
      internal static let pln = L10n.tr("Localizable", "country.key.PLN")
      /// Romanian Leu
      internal static let ron = L10n.tr("Localizable", "country.key.RON")
      /// Russian Ruble
      internal static let rub = L10n.tr("Localizable", "country.key.RUB")
      /// Swedish Krona
      internal static let sek = L10n.tr("Localizable", "country.key.SEK")
      /// Singapore Dollar
      internal static let sgd = L10n.tr("Localizable", "country.key.SGD")
      /// Thai Baht
      internal static let thb = L10n.tr("Localizable", "country.key.THB")
      /// Dollar US
      internal static let usd = L10n.tr("Localizable", "country.key.USD")
      /// South African Rand
      internal static let zar = L10n.tr("Localizable", "country.key.ZAR")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
