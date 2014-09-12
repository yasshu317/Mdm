class AddProfileidToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :profile_id, :integer
  end
end
