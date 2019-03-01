class CreateStep < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.text        :decision, index: true
      t.references  :problem, index: true
      t.timestamps
    end
  end
end
