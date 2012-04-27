class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :pagecontent
      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
    add_index :pages, [:user_id, :story_id, :created_at]
  end
end
