class MakeRomajiNotUnique < ActiveRecord::Migration
  def up
    remove_index :stations, :kana
    remove_index :stations, :kanji
    remove_index :stations, :romaji
    add_index    :stations, :kana
    add_index    :stations, :kanji
    add_index    :stations, :romaji
  end

  def down
    remove_index :stations, :kana
    remove_index :stations, :kanji
    remove_index :stations, :romaji
    add_index    :stations, :kana,   unique: true
    add_index    :stations, :kanji,  unique: true
    add_index    :stations, :romaji, unique: true
  end
end
