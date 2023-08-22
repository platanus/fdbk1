class CreateSessionTags < ActiveRecord::Migration[6.1]
  def change
    create_table :session_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :feedback_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
