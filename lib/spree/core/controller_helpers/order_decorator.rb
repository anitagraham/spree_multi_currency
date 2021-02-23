Spree::Core::ControllerHelpers::Order.class_eval do
  require 'geoip'
  require 'countries'

  def user_ip
    spree_current_user&.current_sign_in_ip || request.remote_ip
  end

  def current_user_country_currency
    @geoip ||= GeoIP.new("#{Rails.root}/db/GeoIP.dat")
    geo_data = @geoip.country(user_ip)
    if geo_data && ISO3166::Country.find_country_by_alpha3(geo_data.country_code3)
      ISO3166::Country.find_country_by_alpha3(geo_data.country_code3).currency_code
    end
  end

  def current_currency
    if session.key?(:currency) && supported_currencies.map(&:iso_code).include?(session[:currency])
      session[:currency]
    elsif !session.key?(:currency) && current_user_country_currency && supported_currencies.map(&:iso_code).include?(current_user_country_currency)
      current_user_country_currency
    else
      Spree::Config[:currency]
    end
  end
end
