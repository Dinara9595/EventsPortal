class AddReferenceToEvent < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :admin
  end
end
