class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :subject
      t.string :name

      t.timestamps
    end
  end
end
