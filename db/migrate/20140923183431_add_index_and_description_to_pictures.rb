class AddIndexAndDescriptionToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :description, :string
    add_reference :pictures, :album, index: true
  end
end
