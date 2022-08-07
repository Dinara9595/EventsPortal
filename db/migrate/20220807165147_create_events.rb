class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false, index: { unique: true }
      t.text :body, null: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
