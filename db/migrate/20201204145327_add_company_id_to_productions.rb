class AddCompanyIdToProductions < ActiveRecord::Migration[6.0]
  def change
    add_column :productions, :company_id, :integer
  end
end
