class CreateTranslations < ActiveRecord::Migration
  def change
    # create translations table if it doesn't exist
    create_table :translations do |t|
      t.integer :translatable_id, required: true
      t.string :translatable_type, required: true
      t.string :translatable_field, required: true
      t.string :locale, length: 5, required: true
      t.text :content
      t.timestamps
    end

    # add index
    add_index :translations, [:translatable_id, :translatable_type, :locale], name: 'record_translations_index'
  end
end
