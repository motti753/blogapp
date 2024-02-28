class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      # t.データ型 :カラム名
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
      t.references :user, null: false
    end
  end
end
