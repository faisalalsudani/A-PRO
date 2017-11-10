class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :bsn
      t.integer :tele

      t.timestamps
    end
  end
end
