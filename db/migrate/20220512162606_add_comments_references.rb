class AddCommentsReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :expense,  foreign_key: true
  end
end
