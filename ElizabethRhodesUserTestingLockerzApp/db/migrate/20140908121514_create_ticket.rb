class CreateTicket < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :number
      t.belongs_to :locker

      t.timestamps
    end
  end
end
