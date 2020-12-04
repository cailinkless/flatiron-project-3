class AddDefaultFalseToPublishedForProductions < ActiveRecord::Migration[6.0]
  def change
    change_column_default :productions, :published, from: nil, to: false
  end
end
