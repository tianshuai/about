class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :name,	    null: false
      t.string :mark,	    null: false
      t.text :content
      t.string :desc
      t.integer :kind,	    null: false,    default: 1
      t.integer :state,	    null: false,    default: 1
      t.integer :user_id,   null: false

      t.timestamps
    end
    add_index :blocks,	    :name
    add_index :blocks,	    :mark,  unique: true
    add_index :blocks,	    :kind
    add_index :blocks,	    :state
    add_index :blocks,	    :user_id
  end
end
