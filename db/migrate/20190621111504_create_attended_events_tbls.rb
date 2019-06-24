class CreateAttendedEventsTbls < ActiveRecord::Migration[5.2]
  def change
    create_table :attended_events_tbls do |t|
      t.timestamps
    end
    add_reference :attended_events_tbls, :attendee, references: :users, index: true, foreign_key: true
    add_reference :attended_events_tbls, :attended_event, references: :events, index: true, foreign_key: true
  end
end
