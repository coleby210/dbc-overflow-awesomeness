class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :positive
      t.belongs_to :user
      t.references :votable, polymorphic: true, index: true

      t.timestamps(null: false)
    end
  end
end
