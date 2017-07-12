module Sbi::Security
  class CLI
    def initialize(user_id, password)
      @client = Sbi::Security::Client.new(user_id, password)
    end

    def portfolio
      portfolio = @client.portfolio

      rows = []
      rows << portfolio.decorate.header
      rows << :separator
      portfolio.stocks.each do |stock|
        rows << stock.decorate.format
      end

      Terminal::Table.new(rows: rows)
    end
  end
end
