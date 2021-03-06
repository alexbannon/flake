class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :event_content
      t.string :event_image_url
      t.datetime :event_time
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
