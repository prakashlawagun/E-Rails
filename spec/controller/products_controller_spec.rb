require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  context 'POST #create' do
    it 'returns a success response' do
      product_attribute = FactoryBot.attributes_for(:product)
      post :create, params: {product: product_attribute}
      expect(response).to redirect_to(products_path)
    end
  end
  context 'PUT #update' do
    it 'returns a success response' do
      product = FactoryBot.create(:product)
      product_attributes = { name: 'Pant', price: '1000', description: 'Good' }
      put :update, params: { id: product.id, product: product_attributes }
      expect(response).to redirect_to(products_path)
    end
  end
  context 'DELETE #destroy' do
    it 'return a success response' do
      product = FactoryBot.create(:product)
      delete :destroy, params: {id: product.id}
      expect(response).to redirect_to(products_path)
    end
  end
end
