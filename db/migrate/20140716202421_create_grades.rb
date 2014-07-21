class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :course_id
      t.float :gpa

      t.timestamps
    end
  end
end
