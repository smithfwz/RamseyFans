class ChangeProductsPax < ActiveRecord::Migration
  def up
  	remove_column :products, :pax
  	add_column :products, :pax, :integer
  end

  def down
  	remove_column :products, :pax
		add_column :products, :pax, :string
  end
end
