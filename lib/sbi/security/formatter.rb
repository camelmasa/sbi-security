module Sbi::Security
  module Formatter
    def currency(number)
      number.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
    end

    def sign(number)
      if number < 0
        currency(number).colorize(:blue)
      elsif number.to_i == 0
        number.to_s
      else
       "+#{currency(number)}".colorize(:red)
      end
    end
  end
end
