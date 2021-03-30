class EditTableNames < ActiveRecord::Migration[5.2]
  def change
      rename_column(:attended_events_tbls, :event_attendee_id, :attendee_id )
      rename_column(:attended_events_tbls, :event_attended_id, :attended_event_id)
  end
end
