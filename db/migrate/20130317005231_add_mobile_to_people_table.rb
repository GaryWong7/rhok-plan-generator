class AddMobileToPeopleTable < ActiveRecord::Migration
  def change
    add_column :people, :mobile, :string
  end
end
