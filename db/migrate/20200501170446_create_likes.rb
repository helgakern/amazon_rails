class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      # user_id -> User.id
      t.references :user, null: false, foreign_key: true, index: true
      # indexing is making the table sort the records that are inserted.
      # if all the records are sorted then underneath the hood the database can implement some searching algorithm
      # to quickly query the record. Do note, this increases the time it takes to insert records
      # review_id -> Review.id
      t.references :review, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
