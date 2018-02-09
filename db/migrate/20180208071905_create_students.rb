class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :gender
      t.string :email
      t.string :password_digest
      t.string :studentnumber
      t.timestamps
    end
  end
end
