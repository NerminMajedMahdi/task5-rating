FactoryBot.define do
	sequence(:email) { |n| "eguser#{n}@outlook.com"}
	factory :user do
		email 
		password "userpassword1"
		first_name "User"
		last_name "Test"
		admin false
	end

	factory :admin, class: User do
		email 
		password "adminpassword1"
		first_name "Admin"
		last_name "Test"
		admin true
	end
end

