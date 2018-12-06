# This migration comes from courses (originally 20171103031720)
class CreateCoursesClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_classes do |t|
      t.string :level

      t.timestamps
    end
  end
end
