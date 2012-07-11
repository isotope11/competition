class CreateCompetitionScoreEntries < ActiveRecord::Migration
  def change
    create_table :competition_score_entries do |t|
      t.integer :score_id
      t.integer :score

      t.timestamps
    end
  end
end
