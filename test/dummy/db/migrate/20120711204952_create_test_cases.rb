class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
