class ChangeLinkToAddressInLink < ActiveRecord::Migration
  def change
    rename_column :links, :link, :address
  end
end
