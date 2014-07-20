class CreateBehaviorTraits < ActiveRecord::Migration
  def change
    create_table :behavior_traits do |t|
    	t.string :name
      t.timestamps
    end
  end
end
