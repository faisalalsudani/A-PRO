class AddTheorieToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :theorie, :integer
  end
end
