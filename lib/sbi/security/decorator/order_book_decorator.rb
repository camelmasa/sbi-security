module Sbi::Security
  class OrderBookDecorator < SimpleDelegator
    def format
      sell_volume = type == "sell" ? volume : ""
      buy_volume  = type == "buy"  ? volume : ""

      [
        sell_volume,
        price,
        buy_volume
      ]
    end
  end
end
