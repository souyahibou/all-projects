# This migration comes from eventbrite (originally 20171103144445)
class JoinTableAtteneesEventbriteUsersEvents < ActiveRecord::Migration[5.1]
  def change
    create_join_table :eventbrite_events, :eventbrite_users do |t|
      t.references :eventbrite_event, index: true
      t.references :eventbrite_user, index: true
    end
  end
end

# rails g migration CreateJoinTableAtteneesEventbriteUsersEvents eventbrite_events eventbrite_users
