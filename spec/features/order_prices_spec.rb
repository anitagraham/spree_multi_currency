RSpec.feature 'Order', :js do
  given!(:product) { create(:product) }

  background do
    create(:store, default_currency: 'USD')
    create(:store, default_currency: 'EUR')
    create(:store, default_currency: 'GBP')
    create(:price, variant: product.master, currency: 'EUR', price: 16.00)
    create(:price, variant: product.master, currency: 'GBP', price: 23.00)
  end

  context 'when existing in the cart' do
    scenario 'changes its currency, if user switches the currency.' do
      visit spree.product_path(product)
      click_button 'Add To Cart'
      check_product_price('$19.99')
      select 'EUR', from: 'currency'
      check_product_price('€16.00')
    end
  end

  def check_product_price(price)
    if Spree.version.to_f >= 3.7
      expect(page).to have_css('#link-to-cart', text: price)
    else
      expect(page).to have_text price
    end
  end
end
