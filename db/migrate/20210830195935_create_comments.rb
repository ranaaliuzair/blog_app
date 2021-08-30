class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :article, null: false,index: true
      t.references :user, null:false, indes: true

      t.timestamps null: false
    end
  end
end
