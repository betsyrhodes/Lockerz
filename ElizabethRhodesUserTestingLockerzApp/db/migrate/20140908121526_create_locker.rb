class CreateLocker < ActiveRecord::Migration
  def change
    create_table :lockers do |t|
      t.string :size
      t.boolean :full, :default => false
      t.integer :number

      t.timestamps
    end
  end
end
