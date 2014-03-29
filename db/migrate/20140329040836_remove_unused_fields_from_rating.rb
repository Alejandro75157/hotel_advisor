class RemoveUnusedFieldsFromRating < ActiveRecord::Migration
  def change
    remove_column :ratings, :default, :string
    remove_column :ratings, :nil, :string
  end
end
