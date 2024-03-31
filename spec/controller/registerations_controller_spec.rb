require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'create a new user and redirects to root path' do
        user_attributes = FactoryBot.attributes_for(:user, name: "Anu", email:"anu@gmail.com", password_digest: "1234567")
        expect {
          post :create, params: { user: user_attributes }
        }.to change(User,:count).by(1)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Welcome to home")
      end
    end
    context 'with invalid parameters' do
      it 'does not create a new user and renders the new templates' do
        user_attributes = FactoryBot.attributes_for(:user,email:nil)
        expect{
          post :create, params: {user: user_attributes}
        }.to_not change(User, :count)
        expect(response).to render_template(:new)
      end
    end
  end
end