class ChangeColumnFlight < ActiveRecord::Migration[5.2]
  def up
    change_column :flights, :duration, :time
  end

  def down
    change_column :flights, :duration, :datetime
  end
end
