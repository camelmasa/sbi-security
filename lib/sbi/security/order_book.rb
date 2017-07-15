module Sbi::Security
  class OrderBook
    include Decorator
    include Virtus.model(strict: true)

    attribute :price,  String
    attribute :volume, String
    attribute :type,   String
  end
end
