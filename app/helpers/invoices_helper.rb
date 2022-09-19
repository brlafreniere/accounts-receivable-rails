module InvoicesHelper
  def to_money(cents, currency=nil)
    currency ||= 'USD'
    case currency

    when 'USD'
      return "$0.00" if cents == 0
      "$#{cents.to_s.insert(-3, ".")}"
    when 'JPY'
      return "0¥" if cents == 0
      converted_yen_value = CurrencyConverter.convert(from: 'USD', to: currency, cents: cents)
      "#{number_with_delimiter(converted_yen_value, delimiter: ',')}¥"
    end
  end
end
