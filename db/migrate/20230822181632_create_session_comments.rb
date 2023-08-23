class CreateSessionComments < ActiveRecord::Migration[6.1]
  def change
    create_table :session_comments do |t|
      t.text :body
      t.references :feedback_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
