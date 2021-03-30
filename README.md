# PRIVATE EVENTS

Building a site similar to a private *Eventbrite* which allows users to create events and then manage user signups(Event subscriptions). Users can create events and send invitations and parties

A user can create events. A user can attend many events. An event can be attended by many users

## DESCRIPTION

There're 3 main models for the app's functionality
- **Event** : Events CRUD functionalities are managed here
- **User** : Users accounts are managed here (account creation, sessions, creation of owned events too)
- **Attended_events_tbl** : With "EVENT" and "USER" having a many-to-many relationship, this third model serves as a 'helper' table to manage this relationship. It primarily contains data that logs which events a user is an attendee.

The association relationship of these 3 models is shown below: 

```
# app/models/event.rb
  class Post < ActiveRecord::Base
    has_many :attended_events_tbl, foreign_key: :attended_event_id
    has_many :attendee, through: :attended_events_tbl

    belongs_to :creator, class_name: "User"
  end


  # app/models/user.rb
  class User < ActiveRecord::Base
      has_many :attended_events_tbl, foreign_key: :attendee_id
      has_many :attended_events, through: :attended_events_tbl

      has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  end



  # app/models/attended_events_tbl.rb
  class attended_events_tbl < ActiveRecord::Base
      belongs_to :attendee, class_name: "User"
      belongs_to :attended_event, class_name: "Event"
  end
```


There's a SESSION_CONTROLLER to manage sessions. Many helper functions to assist the session controller file is found in the **application_controller** file

A rapid glance  of the underlying database is shown below (representation of 'schema.rb' file):

```
create_table "attended_events_tbls", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "attendee_id"
    t.integer "attended_event_id"
    t.index ["attended_event_id"], name: "index_attended_events_tbls_on_attended_event_id"
    t.index ["attendee_id"], name: "index_attended_events_tbls_on_attendee_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "eventdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "string"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
  end
```

## ACKNOWLEDGEMENT
project inspired from
https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/associations

## Contributors

- Louis SHEY _https://github.com/shloch_
- Fabien PHILIP _https://github.com/pwilson77_
