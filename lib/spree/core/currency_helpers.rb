module Spree
  module CurrencyHelpers
    def self.included(receiver)
      receiver.send :helper_method, :supported_currencies
    end

    def supported_currencies
      @supported_currencies ||= Spree::Store.pluck(:default_currency).uniq.compact.map { |code| ::Money::Currency.find(code.strip) }
      @supported_currencies ||= [Spree::Config[:currency]]
    end
  end
end
