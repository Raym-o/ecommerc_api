class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.decimal :price
      t.decimal :pst
      t.decimal :gst
      t.decimal :hst
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
