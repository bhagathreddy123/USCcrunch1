class CreateTeacherClasses < ActiveRecord::Migration
  def change
    create_table :teacher_classes do |t|
      t.integer :user_id
      t.integer :school_class_id
      t.integer :subject_id
      t.timestamps
    end
  end
end
