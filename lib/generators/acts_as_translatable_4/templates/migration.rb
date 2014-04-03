class CreateRecordTranslations < ActiveRecord::Migration
  def self.change
    # create translations table if it doesn't exist
    unless table_exists?(:record_translations)
      create_table :record_translations do |t|
        t.integer :translatable_id, required: true
        t.string :translatable_type, required: true
        t.string :translatable_field, required: true
        t.string :locale, length: 5, required: true
        t.text :content
      end

      # add index
      add_index :record_translations, [:translatable_id, :translatable_type, :locale], name: "record_translations_index"
    end
  end
end