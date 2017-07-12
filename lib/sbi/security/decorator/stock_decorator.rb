module Sbi::Security
  class StockDecorator < SimpleDelegator
    include Sbi::Security::Formatter

    def format
      [
        code,
        name,
        currency(count),
        currency(value),
        currency(price),
        sign(price_ratio),
        sign(price_ratio_percentage),
        sign(profit),
        sign(profit_percentage),
        currency(total_value)
      ]
    end
  end
end
