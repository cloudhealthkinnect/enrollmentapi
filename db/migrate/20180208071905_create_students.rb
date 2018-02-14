class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :password_digest
      t.string :student_number
      t.timestamps
    end
  end
end
