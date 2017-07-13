module Sbi::Security
  class StockDecorator < SimpleDelegator
    include Sbi::Security::Formatter

    def header
      %w(コード 銘柄 現在値 前日比 前日(%))
    end

    def format
      [
        code,
        name,
        currency(price),
        sign(price_ratio),
        sign(price_ratio_percentage)
      ]
    end
  end
end
