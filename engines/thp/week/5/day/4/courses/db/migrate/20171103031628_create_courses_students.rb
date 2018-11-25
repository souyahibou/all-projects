class CreateCoursesStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_students do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
