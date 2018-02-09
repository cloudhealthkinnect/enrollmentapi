class CreateJoinTableStudentCourse < ActiveRecord::Migration[5.1]
  def change
    create_join_table :students, :courses do |t|
      t.integer :student_id
      t.integer :course_id
      # t.index [:student_id, :course_id]
      # t.index [:course_id, :student_id]
    end
  end
end
