class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :kind
      t.date :date_ocurrence
      t.decimal :price
      t.string :cpf
      t.string :card
      t.string :store_owner
      t.string :store_name

      t.timestamps
    end
  end
end
