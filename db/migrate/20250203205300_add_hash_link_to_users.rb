class AddHashLinkToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :hash_link, :string
  end
end
