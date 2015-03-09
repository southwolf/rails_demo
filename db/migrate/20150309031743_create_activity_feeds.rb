class CreateActivityFeeds < ActiveRecord::Migration
  def change
    create_table :activity_feeds do |t|
      t.belongs_to :receiver, index: true
      t.references :trigger_source, polymorphic: true

      t.timestamps null: false
    end
    add_index :activity_feeds, ['trigger_source_id', 'trigger_source_type'], name: 'af_trigger_source'
  end
end
