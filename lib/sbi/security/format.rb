module Sbi::Security
  module Format
    def format(number)
      return number.to_s if number == 0

      if number > 0
        "+#{number_to_currency(number)}".colorize(:red)
      else
        "-#{number_to_currency(number)}".colorize(:blue)
      end
    end

    def number_to_currency(number)
      number.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
    end
  end
end
