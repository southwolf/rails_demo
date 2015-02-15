class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
