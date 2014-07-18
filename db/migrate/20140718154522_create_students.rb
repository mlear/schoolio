class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :student_behavior_id
    	t.integer :learing_style_id
    	t.integer :behaviour_trait_id
    	t.integer :student_interest_id
    	t.integer :grade
    	t.string :school_name
      t.timestamps
    end
  end
end
