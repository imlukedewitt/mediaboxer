class CreateVideoQueues < ActiveRecord::Migration[8.0]
  def change
    create_table :video_queues do |t|
      t.integer :current_video_id
      t.boolean :is_playing

      t.timestamps
    end
  end
end
