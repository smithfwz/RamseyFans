class ChangeProductsPax < ActiveRecord::Migration
  def change
  	change_column :products, :pax, :integer
  end
end
