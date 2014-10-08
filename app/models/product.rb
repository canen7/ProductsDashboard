class Product < ActiveRecord::Base
	belongs_to :category
	validates :name, :description, :pricing, :category_id, presence: true
end
