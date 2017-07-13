module Sbi::Security
  class PortfolioStock
    include Decorator
    include Virtus.model(strict: true)

    attribute :code, Integer
    attribute :name, String
    attribute :count, Integer
    attribute :value, Float
    attribute :price, Integer

    # Basically, price_ratio is Integer and price_ratio_percentage is Float.
    # Those are nil after 9:00 JST so we can't define type.
    attribute :price_ratio
    attribute :price_ratio_percentage

    attribute :profit, Integer
    attribute :profit_percentage, Float
    attribute :total_value, Integer
  end
end
