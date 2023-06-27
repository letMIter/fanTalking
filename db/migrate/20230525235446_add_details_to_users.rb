class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fan2, :string
    add_column :users, :fan3, :string
  end
end
