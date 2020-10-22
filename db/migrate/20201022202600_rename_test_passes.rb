class RenameTestPasses < ActiveRecord::Migration[6.0]
  def change
    rename_table :test_passes, :test_passages
    add_reference :test_passages, :current_question, foreign_key: {to_table: :questions}, null: false
    add_column :test_passages, :correct_questions, :string, default: 0
  end
end
