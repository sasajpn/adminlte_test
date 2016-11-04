class CreateUserBlogs < ActiveRecord::Migration
  def change
    create_table :user_blogs do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
