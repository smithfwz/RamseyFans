class Dish < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :cost, presence: true, numericality: {greater_than: 0}

	scope :search_by, ->(keyword){ where("title ILIKE ? OR description ILIKE ?", "%#{keyword}%", "%#{keyword}%")}
end