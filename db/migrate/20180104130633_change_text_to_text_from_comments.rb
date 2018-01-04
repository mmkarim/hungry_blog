class ChangeTextToTextFromComments < ActiveRecord::Migration[5.0]
  change_table :comments do |t|
    t.change :text, :text
  end
end
