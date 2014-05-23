class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :schooladmin_id
      t.integer :school_class_id
      t.string :subjectname
      t.string :subjectdescription
      t.integer :user_id
      t.timestamps
    end
  end
end

