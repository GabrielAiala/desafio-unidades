class CreateUnit < ActiveRecord::Migration[7.0]
  def change
    create_enum :mask_enum, ["required", "not_required", "recommended"]
    create_enum :towel_enum, ["required", "not_required", "recommended"]
    create_enum :fountain_enum, ["partial", "not_allowed", "allowed"]
    create_enum :locker_room_enum, ["allowed", "closed"]

    create_table :units do |t|
      t.string :title
      t.string :content
      t.boolean :opened, default: true
      t.enum :mask, enum_type: :mask_enum, default: "required"
      t.enum :towel, enum_type: :towel_enum, default: "required"
      t.enum :fountain, enum_type: :fountain_enum, default: "partial"
      t.enum :locker_room, enum_type: :locker_room_enum, default: "allowed"
      
      t.timestamps
    end
  end
end
