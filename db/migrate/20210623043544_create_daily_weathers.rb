class CreateDailyWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_weathers do |t|
      t.string :date
      t.string :time
      t.string :temperature

      t.timestamps
    end
  end
end
