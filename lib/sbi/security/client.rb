module Sbi::Security
  class Client
    def initialize(user_id, password)
      @user_id, @password = user_id, password
    end

    def portfolio
      crawler.portfolio
    end

    def stock(code)
      crawler.stock(code)
    end

    private

    def crawler
      @crawler ||= Crawler.new(@user_id, @password)
    end
  end
end
