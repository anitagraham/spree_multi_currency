RSpec.feature 'Product with prices in multiple currencies' do
  context 'with USD, EUR and GBP as currencies' do
    given!(:product) { create(:product) }

    background do
      create(:store, default_currency: 'USD')
      create(:store, default_currency: 'EUR')
      create(:store, default_currency: 'GBP')
      create(:price, variant: product.master, currency: 'EUR', price: 16.00)
      create(:price, variant: product.master, currency: 'GBP', price: 23.00)
    end

    scenario 'can switch by currency', :js do
      visit spree.product_path(product)
      expect(page).to have_current_path(spree.product_path(product))
      expect(page).to have_css('.lead.price.selling', text: '$19.99')
      select 'EUR', from: 'currency'
      expect(page).to have_css('.lead.price.selling', text: '€16.00')
      select 'GBP', from: 'currency'
      expect(page).to have_css('.lead.price.selling', text: '£23.00')
    end
  end
end
