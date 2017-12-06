class AddParentToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :parent, :integer
  end
end
