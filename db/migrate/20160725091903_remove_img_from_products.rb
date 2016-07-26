class RemoveImgFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :img, :string
  end
end
