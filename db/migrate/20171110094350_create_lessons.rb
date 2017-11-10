class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.references :student, foreign_key: true
      t.date :date
      t.time :time
      t.boolean :paid

      t.timestamps
    end
  end
end
