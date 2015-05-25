class AddFiledsToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :cost, :decimal, precision: 10, scale: 2
  	add_column :products, :pax, :string
  	add_column :products, :vegetarian, :boolean
  end
end
