class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :production
      t.string :city
      t.string :place
      t.date :from
      t.date :to
      t.text :notes

      t.timestamps null: false
    end
  end
end
