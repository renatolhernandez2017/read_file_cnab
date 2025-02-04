class AddTimeOcurrenceToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :time_ocurrence, :time
  end
end
