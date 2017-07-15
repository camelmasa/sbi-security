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

    def stock(code)
      stock = @client.stock(code)

      rows = []
      rows << stock.decorate.header
      rows << :separator
      rows << stock.decorate.format
      stock_table = Terminal::Table.new(rows: rows)

      rows = []
      rows << stock.decorate.order_book_header
      rows << :separator
      stock.order_books.each do |order_book|
        rows << order_book.decorate.format
      end
      order_book_table = Terminal::Table.new(rows: rows)

      "#{stock_table}\n\n#{order_book_table}"
    end
  end
end
