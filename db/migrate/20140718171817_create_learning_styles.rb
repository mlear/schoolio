class CreateLearningStyles < ActiveRecord::Migration
  def change
    create_table :learning_styles do |t|
    	t.string :name
    	t.text :description
      t.timestamps
    end
  end
end
