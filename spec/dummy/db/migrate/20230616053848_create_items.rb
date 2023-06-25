class CreateItems < ActiveRecord::Migration::Current
  def change
    create_table :items do |t|
      t.text       :title
      t.integer    :partition1
      t.integer    :partition2
    end
  end
end
