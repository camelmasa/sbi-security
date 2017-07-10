module Sbi::Security
  class Portfolio
    attr_reader :stocks

    def initialize(stocks)
      @stocks = stocks
    end
  end
end
