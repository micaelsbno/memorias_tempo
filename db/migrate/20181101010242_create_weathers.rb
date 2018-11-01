class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.references :post, foreign_key: true
      t.string :city
      t.string :country
      t.float :lat
      t.float :lon
      t.string :description
      t.string :brief

      t.timestamps
    end
  end
end
