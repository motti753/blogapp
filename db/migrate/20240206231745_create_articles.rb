class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      # t.データ型 :カラム名
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end