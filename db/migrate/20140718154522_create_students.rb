class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :student_behavior_id
    	t.integer :learning_style_id
    	t.integer :behaviour_trait_id
    	t.integer :student_interest_id
    	t.integer :grade
    	t.string :school_name
      t.string :avatar
      t.timestamps
    end
  end
end
