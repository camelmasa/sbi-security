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

      stocks = page.all(:xpath, '//table[@width="100%"]/tbody/tr[@align="center"]').each_with_index.map do |tr, i|
        # Ignore title row
        next if i == 0

        _, code_and_name, _, count, value, price, price_ratio, price_ratio_percentage, profit, profit_percentage,
          total_value = tr.all("td").map(&:text)

        PortfolioStock.new(
          code: code_and_name.split(" ").first,
          name: code_and_name.split(" ").last,
          count: count.gsub(/,/, ""),
          value: value.gsub(/,/, ""),
          price: price.gsub(/,/, ""),
          price_ratio: price_ratio == "--" ? nil : price_ratio.gsub(/,/, "").to_i,
          price_ratio_percentage: price_ratio_percentage == "--" ? nil : price_ratio_percentage.gsub(/,/, "").to_f,
          profit: profit.gsub(/,/, ""),
          profit_percentage: profit_percentage.gsub(/,/, ""),
          total_value: total_value.gsub(/,/, "")
        )
      end.compact

      Portfolio.new(stocks)
    end

    def stock(code)
      fill_in :i_stock_sec, with: code
      find("img[title='株価検索']").click

      # SBI security has XHR for fetching information. Need to wait until page finish to emulate JavaScript.
      loop do
        if page.find(:xpath, "//td[@id='MTB0_0']/p/em/span[@class='fxx01']").text != "--"
          break
        end
        sleep 1
      end

      price_ratio = page.all(:xpath, "//td[@id='MTB0_1']/p/span").first.text.to_i
      price_ratio_percentage = page.all(:xpath, "//td[@id='MTB0_1']/p/span").last.text.to_f

      Stock.new(
        code: code,
        name: page.find(:xpath, "//h3/span[@class='fxx01']").text,
        price: page.find(:xpath, "//td[@id='MTB0_0']/p/em/span[@class='fxx01']").text.gsub(/,/, ""),
        price_ratio: price_ratio == "--" ? nil : price_ratio ,
        price_ratio_percentage: price_ratio_percentage == "--" ? nil : price_ratio_percentage
      )
    end

    private

    def login(user_id, password)
      visit TOP_PAGE
      fill_in :user_id, with: user_id
      fill_in :user_password, with: password
      find_button(class: "ov").click
    end
  end
end
