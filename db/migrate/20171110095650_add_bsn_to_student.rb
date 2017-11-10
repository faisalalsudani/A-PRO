class AddBsnToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :bsn_num, :string
  end
end
