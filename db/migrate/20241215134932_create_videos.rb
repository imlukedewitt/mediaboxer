class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
