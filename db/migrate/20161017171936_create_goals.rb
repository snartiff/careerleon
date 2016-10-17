class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :title, presence: true
      t.string :description, presence: true
      t.string :deadline, presence: true
      t.belongs_to :user, presence: true
      t.timestamps
    end
  end
end
