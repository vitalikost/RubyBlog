class CreateUserlikes < ActiveRecord::Migration[5.1]
  def change
    create_table :userlikes do |t|
      t.integer :id_user
      t.integer :id_question
      t.integer :like

      t.timestamps
    end
  end
end
