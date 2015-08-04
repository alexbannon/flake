class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
    end
  end
end
