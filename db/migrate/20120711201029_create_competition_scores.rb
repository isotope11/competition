class CreateCompetitionScores < ActiveRecord::Migration
  def change
    create_table :competition_scores do |t|
      t.string :scoreable_type
      t.integer :scoreable_id

      t.timestamps
    end
  end
end
