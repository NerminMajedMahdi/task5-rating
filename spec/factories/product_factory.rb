FactoryBot.define do
	sequence(:id) { |n| "#{n}" }

	factory :product do
		id
		name "Product Name"
		description "Product Description"
		price "100"
		colour "blue"
	end

end