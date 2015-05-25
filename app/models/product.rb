class Product < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :cost, presence: true, numericality: {greater_than: 0}
end