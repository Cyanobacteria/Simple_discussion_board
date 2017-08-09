class Post < ActiveRecord::Migration[5.1]
  def change
   # add_column :posts do |t|
    #  t.integer :group_id
    #end
    add_column :posts, :group_id, :integer
  end
end
