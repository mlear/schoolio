class CreateWats < ActiveRecord::Migration
  def change
    create_table :wats do |t|
    	t.integer :student_id
    	t.integer :instructor_id
      t.timestamps
    end
  end
end
