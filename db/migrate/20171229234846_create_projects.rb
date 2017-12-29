class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.text :address
      t.integer :type
      t.integer :project_category
      t.text :budget
      t.string :cover_image

      t.timestamps
    end
  end
end
