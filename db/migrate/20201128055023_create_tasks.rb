class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :detail
      t.belongs_to :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
