module Sbi::Security
  class Stock
    include Virtus.model(strict: true)

    attribute :code, Integer
    attribute :name, String
    attribute :count, Integer
    attribute :value, Float
    attribute :price, Integer
    attribute :price_ratio, Integer
    attribute :price_ratio_percentage, Float
    attribute :profit, Integer
    attribute :profit_percentage, Float
    attribute :total_value, Integer
  end
end
