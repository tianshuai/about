class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string :title,		    null: false
      t.string :content
      t.string :url
      t.string :desc
      t.string :user_id,	    null: false
      t.integer :cover_id
      t.integer :column_space_id,   null: false
      t.integer :kind,		    null: false,    default: 1
      t.integer :state,		    null: false,    default: 1
      t.integer :sort,		    null: false,    default: 0
      t.integer :stick,		    null: false,    default: 0

      t.timestamps
    end
    add_index :columns,	:title
    add_index :columns, :user_id
    add_index :columns,	:cover_id
    add_index :columns,	:column_space_id
    add_index :columns, :kind
    add_index :columns, :state
    add_index :columns, :sort
  end
end
