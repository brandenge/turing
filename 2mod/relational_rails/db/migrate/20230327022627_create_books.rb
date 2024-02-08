class CreateBooks < ActiveRecord::Migration[5.2]
  # rails g migration CreateBooks title:text subtitle:text publisher:text publication_date:date is_in_print:boolean page_count:integer author:references

  def change
    create_table :books do |t|
      t.text :title, null: false
      t.text :subtitle, null: true
      t.text :publisher, null: false
      t.date :publication_date, null: false
      t.boolean :is_in_print, null: false, default: true
      t.integer :page_count, null: false
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
