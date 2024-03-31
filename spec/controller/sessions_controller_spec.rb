require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid credentials' do
      let(:valid_user) {
        FactoryBot.create(:user, name: "Geeta", email: "Geeta@gmail.com", password: "123456")
      }
      it 'login to the web page and redirect to home page' do
        post :create, params: { email: valid_user.email, password: '123456' }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('You have signed successfully.')
      end
    end
    context 'with invalid credentials' do
      let(:valid_user) {
        FactoryBot.create(:user, name: "Remo", email: "remo@gmail.com", password: "123456")
      }
      it 'redirect to login page' do
        post :create, params: { email: valid_user.email, password: nil }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) {
      FactoryBot.create(:user, name:"kaji", email: "kaji@gmail.com", password:"123456")
    }
    before do
      login user
    end
    it 'logout the user and redirects to root path' do
      delete :destroy
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq('You have been logged out.')
    end
  end

end