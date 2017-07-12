module Sbi::Security
  class PortfolioDecorator < SimpleDelegator
    def header
      %w(コード 銘柄 数量 参考単価 現在値 前日比 前日(%) 損益 損益(%) 評価額)
    end
  end
end
