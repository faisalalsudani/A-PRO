class AddPhoneToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :phone, :string
  end
end
