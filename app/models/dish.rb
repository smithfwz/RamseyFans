class Dish < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :cost, numericality: {greater_than: 0, allow_nil: true}
	validates :pax, numericality: { only_integer: true, allow_nil: true, greater_than: 0}

	belongs_to :fan

	scope :search_by, ->(keyword){ where("title ILIKE ? OR description ILIKE ?", "%#{keyword}%", "%#{keyword}%")}
end