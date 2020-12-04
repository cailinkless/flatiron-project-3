class AddUserIdToProductions < ActiveRecord::Migration[6.0]
  def change
    add_column :productions, :user_id, :integer
  end
end
