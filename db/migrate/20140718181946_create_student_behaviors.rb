class CreateStudentBehaviors < ActiveRecord::Migration
  def change
    create_table :student_behaviors do |t|
    	t.integer :student_id
    	t.integer :behavior_trait_id
    	t.integer :value
      t.timestamps
    end
  end
end
