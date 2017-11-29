class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :commenter
      t.text :body
      t.references :question, foreign_key: true
      t.integer :user_id
      t.timestamps
    end
  end
end
