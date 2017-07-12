module Sbi::Security
  class Portfolio
    include Decorator

    attr_reader :stocks

    def initialize(stocks)
      @stocks = stocks
    end
  end
end
