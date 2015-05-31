class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.date :date
      t.time :time
      t.belongs_to :period, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
