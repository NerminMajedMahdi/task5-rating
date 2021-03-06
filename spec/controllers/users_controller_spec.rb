require 'rails_helper'

describe UsersController, type: :controller do

	before do
		# let(:user1) { User.create!(email: 'user1@gmail.com', password: 'exampleuser1', first_name: 'First', last_name: 'test1') }
		@user1 = FactoryBot.create(:user)
		@user2 = FactoryBot.create(:user)
	end

	describe 'GET #show' do
		context 'when a user is logged in' do
			before do
				sign_in @user1
			end

			it "loads correct user details" do
				get :show, params: { id: @user1.id }
				expect(assigns(:user)).to eq @user1
				expect(response).to have_http_status(200)
			end

			it 'cannot access other users show page' do
				get :show, params: { id: @user2.id }
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)
			end
		end

		context 'when a user is not logged in' do
			it 'redirects to login' do
				get :show, params: { id: @user1.id }
				expect(response).to redirect_to(new_user_session_path)
			end
		end
	end

end