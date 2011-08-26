class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :kanji
      t.string :kana
      t.string :romaji
      t.string :ascii
      t.string :slug
    end
    add_index :companies, :slug, unique: true
    
    add_column :lines, :company_id, :integer
    add_index  :lines, :company_id
  end
end
