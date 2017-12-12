class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :id_question
      t.integer :id_user
      t.timestamps
    end
  end
end
