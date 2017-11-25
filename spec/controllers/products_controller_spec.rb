require 'rails_helper'

describe ProductsController, type: :controller do

	#index action
	context 'GET #index' do
		it 'renders the index page' do
			get :index
			expect(response).to be_ok
			expect(response).to render_template('index')
		end
	end

	#show action
	context 'GET #show' do
		it 'renders the show page' do
			@product = FactoryBot.create(:product)
			get :show, params: {id: @product}
			expect(response).to be_ok
			expect(response).to render_template('show')
		end
	end

	#create action
	context 'POST #update' do
		before do
			@product = FactoryBot.create(:product)
			@user = FactoryBot.build(:user)
			sign_in @user
		end
		it "updates product information" do
			@update = { name: @product.name, image_url: "http://www.image.com", price: @product.price, colour: "black" }
			put :update, params: { id: @product.id, product: @update }
			@product.reload
			expect(@product.colour).to eq "black"
		end
	end

	#delete action
	context "delete" do
		before do
			@product = FactoryBot.create(:product)
			@user = FactoryBot.create(:user)
			sign_in @user
		end
		it "deletes product" do 
			delete :destroy, params: { id: @product }
			expect(response).to redirect_to products_path
		end
	end

end