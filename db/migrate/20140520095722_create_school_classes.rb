class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.string :name
      t.string :description
       t.integer :school_admin_id
       t.integer :user_id
       t.timestamps
    end
  end
end
