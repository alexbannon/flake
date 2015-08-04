class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.string :comment_content
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
