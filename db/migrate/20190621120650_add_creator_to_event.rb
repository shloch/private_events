class AddCreatorToEvent < ActiveRecord::Migration[5.2]
  def change
	add_reference :events, :creator, references: :users, index: true, foreign_key: true
  end
end
