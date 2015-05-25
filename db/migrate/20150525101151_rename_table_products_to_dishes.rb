class RenameTableProductsToDishes < ActiveRecord::Migration
  def up
  	rename_table :products, :dishes
  end

  def down
  	rename_table :dishes, :products
  end
end
