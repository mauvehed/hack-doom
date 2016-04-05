class CreateDoomLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :doom_logs do |t|
      t.text :content

      t.timestamps
    end
  end
end
