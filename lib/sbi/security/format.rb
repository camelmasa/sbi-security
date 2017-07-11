module Sbi::Security
  module Format
    def format(number)
      if number.nil? || number == 0
        return number.to_s
      end

      if number > 0
        "+#{number_to_currency(number)}".colorize(:red)
      else
        "#{number_to_currency(number)}".colorize(:blue)
      end
    end

    def number_to_currency(number)
      number.to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, '\1,')
    end
  end
end
