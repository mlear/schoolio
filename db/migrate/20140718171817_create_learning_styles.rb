class CreateLearningStyles < ActiveRecord::Migration
  def change
    create_table :learning_styles do |t|
    	t.string :name
      t.timestamps
    end
  end
end
