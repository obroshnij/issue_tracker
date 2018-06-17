class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title, null: false
      t.text :description
      t.integer :owner_id, null: false
      t.integer :assignee_id
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
