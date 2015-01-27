class AddSubjectsRecipientsToVerbs < ActiveRecord::Migration
  def change
    add_column :verbs, :subject_types, :string,  array: true, default: ['people', 'places']
    add_column :verbs, :subject_limit, :integer

    add_column :verbs, :recipient_types, :string,  array: true, default: ['people', 'places']
    add_column :verbs, :recipient_limit, :integer
  end
end
