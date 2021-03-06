class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :video
      t.references :album, index: true

      t.timestamps
    end
  end
end
