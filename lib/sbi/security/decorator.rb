module Sbi::Security
  module Decorator
    def decorate
      Object.const_get("#{self.class}Decorator").new(self)
    end
  end
end
