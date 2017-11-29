class AddLikeToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :like, :integer
  end
end
