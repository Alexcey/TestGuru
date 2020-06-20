class CreateTestPasses < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passes do |t|
      t.belongs_to :user
      t.belongs_to :test

      t.timestamps
    end
  end
end
