class AddFanToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :fan, :string
  end
end
