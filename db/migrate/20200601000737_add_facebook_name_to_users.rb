class AddFacebookNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :facebook_name, :string
  end
end
