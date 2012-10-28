class CreateAppConfigs < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.string :name
      t.string :value
      t.string :cdata_type, :limit => 1, :default => "s"

      t.timestamps
    end
  end
end
