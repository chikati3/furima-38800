class CreateExhibitionProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibition_products do |t|

      t.timestamps
    end
  end
end
