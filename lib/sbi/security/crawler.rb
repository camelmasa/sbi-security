module Sbi::Security
  class Crawler
    include Capybara::DSL

    TOP_PAGE = "https://www.sbisec.co.jp/ETGate"

    Capybara.register_driver :headless_chromium do |app|
      options = { args: %w{headless no-sandbox disable-gpu} }
      caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: options)
      Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)
    end

    Capybara.default_driver = :headless_chromium

    def initialize(user_id, password)
      login(user_id, password)
    end

    def portfolio
      find("img[title='ポートフォリオ']").click

      stocks = all(:xpath, '//table[@width="100%"]/tbody/tr[@align="center"]').drop(1).each_with_index.map do |tr, i|
        _, code_and_name, _, count, value, price, price_ratio, price_ratio_percentage, profit, profit_percentage,
          total_value = tr.all("td").map { |td| td.text.gsub(/,/, "") }

        PortfolioStock.new(
          code: code_and_name.split(" ").first,
          name: code_and_name.split(" ").last,
          count: count,
          value: value,
          price: price,
          price_ratio: empty_string_to_num(price_ratio).to_i,
          price_ratio_percentage: empty_string_to_num(price_ratio_percentage).to_f,
          profit: profit,
          profit_percentage: profit_percentage,
          total_value: total_value
        )
      end

      Portfolio.new(stocks)
    end

    def stock(code)
      find(:xpath, "//input[@id='top_stock_sec']").set code
      find("img[title='株価検索']").click

      # SBI security has XHR for fetching information. Need to wait until page finish to emulate JavaScript.
      loop do
        if find(:xpath, "//td[@id='MTB0_0']/p/em/span[@class='fxx01']").text != "--"
          break
        end
        sleep 1
      end

      price_ratio, price_ratio_percentage = all(:xpath, "//td[@id='MTB0_1']/p/span").map { |td| td.text.gsub(/,/, "") }
      start_price, end_price, highest_price, total_stock, lowest_price, total_price = all(:xpath, "//table[@class='tbl690']/tbody/tr/td/p/span[@class='fm01']").map { |td| td.text.gsub(/,/, "") }

      Stock.new(
        code: code,
        name: find(:xpath, "//h3/span[@class='fxx01']").text,
        price: find(:xpath, "//td[@id='MTB0_0']/p/em/span[@class='fxx01']").text.gsub(/,/, ""),
        price_ratio: empty_string_to_num(price_ratio).to_i,
        price_ratio_percentage: empty_string_to_num(price_ratio_percentage).to_f,
        start_price: start_price.to_i,
        end_price: end_price,
        highest_price: highest_price.to_i,
        total_stock: total_stock.to_i,
        lowest_price: lowest_price.to_i,
        total_price: total_price.to_i * 1000
      )
    end

    private

    def login(user_id, password)
      visit TOP_PAGE
      fill_in :user_id, with: user_id
      fill_in :user_password, with: password
      find_button(class: "ov").click
    end

    def empty_string_to_num(string)
      string == "--" ? nil : string
    end
  end
end
