class CreateCompetitionScoreEntries < ActiveRecord::Migration
  def change
    create_table :competition_score_entries do |t|
      t.string :score_entryable_type
      t.integer :score_entryable_id
      t.integer :score_id
      t.integer :amount

      t.timestamps
    end
  end
end
