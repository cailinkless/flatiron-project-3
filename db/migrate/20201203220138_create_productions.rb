class CreateProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :productions do |t|
      t.string :title
      t.datetime :opening
      t.datetime :closing

      t.timestamps
    end
  end
end
