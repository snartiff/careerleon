class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.string :description, presence: true
      t.string :deadline, presence: true
      t.belongs_to :user
      t.belongs_to :goal
      t.timestamps
    end
  end
end
