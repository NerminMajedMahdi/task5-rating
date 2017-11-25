class Product < ApplicationRecord

	validates :name, presence: true

	has_many :comments

	def self.search(search_term)
		if Rails.env.development?
			Product.where("name LIKE ?", "%#{search_term}%")
		else
			Product.where("name ilike ?", "%#{search_term}%")
		end
	end

	def display_price
		Product.price = (product.price / 100)
	end

	def highest_rating_comment
		comments.rating_desc.first
	end

	def average_rating
		comments.average(:rating).to_f
	end
end
