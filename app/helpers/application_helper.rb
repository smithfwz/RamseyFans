module ApplicationHelper
	def format_date(date)
		date.strftime("%d-%m-%Y")
	end

	def boolean_to_text(boolean)
		boolean ? 'Yes' : 'No'
	end
end
