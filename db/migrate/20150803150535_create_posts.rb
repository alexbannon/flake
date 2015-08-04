class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.string :post_content
      t.string :image_url
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
