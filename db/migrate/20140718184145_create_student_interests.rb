class CreateStudentInterests < ActiveRecord::Migration
  def change
    create_table :student_interests do |t|
    	t.integer :student_id
    	t.integer :interest_id
      t.timestamps
    end
  end
end
