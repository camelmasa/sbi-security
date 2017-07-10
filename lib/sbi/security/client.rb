module Sbi::Security
  class Client
    def initialize(id, password)
      @id, @password = id, password
    end

    def portfolio
      crawler.portfolio
    end

    private

    def crawler
      @crawler ||= Crawler.new(@id, @password)
    end
  end
end
