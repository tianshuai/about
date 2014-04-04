class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name,		null: false
      t.string :mark,		null: false
      t.integer :user_id,	null: false
      t.string :value
      t.string :content
      t.integer :kind,		null: false,	default: 1
      t.integer :state,		null: false,	default: 0

      t.timestamps
    end
    add_index :systems,	    :mark,  unique: true
    add_index :systems,	    :name
  end
end
