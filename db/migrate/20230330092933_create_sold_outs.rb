class CreateSoldOuts < ActiveRecord::Migration[6.0]
  def change
    create_table :sold_outs do |t|
      t.references    :exhibition_product,   null: false, foreign_key: true
      t.references    :user,                 null: false, foreign_key: true

      t.timestamps
    end
  end
end
