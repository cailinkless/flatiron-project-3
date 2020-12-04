class AddPublishedToProductions < ActiveRecord::Migration[6.0]
  def change
    add_column :productions, :published, :boolean
  end
end
