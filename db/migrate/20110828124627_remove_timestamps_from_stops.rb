class RemoveTimestampsFromStops < ActiveRecord::Migration
  def change
    remove_column :stops, :created_at
    remove_column :stops, :updated_at
  end
end
