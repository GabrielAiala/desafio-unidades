class CreateUnit < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :title
      t.string :content
      t.boolean :opened, default: true
      t.integer :mask, default: 0
      t.integer :towel, default: 0
      t.integer :fountain, default: 0
      t.integer :locker_room, default: 0
      
      t.timestamps
    end
  end
end
