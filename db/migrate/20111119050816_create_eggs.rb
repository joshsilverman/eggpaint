class CreateEggs < ActiveRecord::Migration
  def change
    create_table :eggs do |t|
      t.string :name

      t.timestamps
    end
  end
end
