class CreateExhibitionProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibition_products do |t|
      t.string        :product_name, null: false
      t.text          :description_item, null: false
      t.integer       :category_id, null: false
      t.integer       :commodity_condition_id, null: false
      t.integer       :delivery_charge_id, null: false
      t.integer       :delivery_area_id, null: false
      t.integer       :delivery_day_id, null: false
      t.integer       :price, null: false
      t.references    :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
