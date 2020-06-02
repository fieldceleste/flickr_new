class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.column :content, :string
      t.column :user_id, :integer
      t.column :photo_id, :integer
      t.timestamps
    end

  end
end
