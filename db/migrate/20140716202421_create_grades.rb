class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :user_id
      t.integer :course_id
      t.float :gpa
      
      t.timestamps
    end
  end
end
