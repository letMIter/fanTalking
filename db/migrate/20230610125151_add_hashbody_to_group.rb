class AddHashbodyToGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :hashbody, :string
  end
end
