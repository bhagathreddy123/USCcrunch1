class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :school_class_id
      t.date :attendance_day
      t.timestamps
    end
  end
end
