# This migration comes from courses (originally 20171103031951)
class CreateCoursesStudentsClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_students_classes, id: false do |t|
      t.belongs_to :courses_classe, foreign_key: true
      t.belongs_to :courses_student, foreign_key: true

      t.timestamps
    end
  end
end

# create_table :assemblies_parts, id: false do |t|
#       t.belongs_to :assembly, index: true
#       t.belongs_to :part, index: true
#     end
