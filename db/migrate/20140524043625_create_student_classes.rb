class CreateStudentClasses < ActiveRecord::Migration
  def change
    create_table :student_classes do |t|
      t.integer :user_id
      t.integer :school_class_id
      t.timestamps
    end
  end
end
