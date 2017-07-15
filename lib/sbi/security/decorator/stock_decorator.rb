module Sbi::Security
  class StockDecorator < SimpleDelegator
    include Sbi::Security::Formatter

    def header
      %w(コード 銘柄 現在値 前日比 前日(%) 始値 高値 安値 前日終値 出来高 売買代金)
    end

    def format
      [
        code,
        name,
        currency(price),
        sign(price_ratio),
        sign(price_ratio_percentage),
        currency(start_price),
        currency(highest_price),
        currency(lowest_price),
        currency(end_price),
        currency(total_stock),
        currency(total_price)
      ]
    end
  end
end
