class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.string :name
      t.string :email
      t.string :text

      t.timestamps
    end
  end
end
