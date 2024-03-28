require 'rails_helper'
RSpec.feature "Products", type: :feature do

  scenario "User views list of products" do
    FactoryBot.create(:product, name: "Jacket", price: "1000", description: "Good")
    visit products_path
    expect(page).to have_content("Jacket")
    expect(page).to have_content("1000")
    expect(page).to have_content("Good")
  end

  scenario "User views a specific product" do
    product = FactoryBot.create(:product, name: "Jacket", price: "1000", description: "Good")
    visit product_path(product)
    expect(page).to have_content("Jacket")
    expect(page).to have_content("1000")
    expect(page).to have_content("Good")
  end

  context 'User create new product' do
    scenario "should be successful" do
      visit new_product_path
      within('.needs-validation') do
        fill_in 'product[name]', with: 'jacket'
        fill_in 'product[price]', with: '100.00'
        fill_in 'product[description]', with: 'Good'
      end
      click_button 'Create Product'
      expect(page).to have_current_path(products_path)
    end
    scenario "should be fail" do
      visit new_product_path
      click_button 'Create Product'
      expect(page).to have_current_path(new_product_path)
    end
  end

  context 'User update product' do
    scenario "should be successful" do
      product = FactoryBot.create(:product, name: "Jacket", price: "1000", description: "Good")
      visit edit_product_path(product)
      within('.needs-validation') do
        fill_in 'product[name]', with: 'Shirt'
        fill_in 'product[price]', with: '1200'
      end
      click_button 'Edit Product'
      expect(page).to have_current_path(products_path)
    end
  end

  context 'User destroy product' do
    scenario "should be successful" do
      product = FactoryBot.create(:product, name: "Jacket", price: "1000", description: "Good")
      visit product_path(product)
      click_button 'Delete'
      expect(page).to have_current_path(products_path)
    end
  end
end
