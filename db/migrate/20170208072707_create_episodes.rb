class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :youtube_id

      t.timestamps
    end
  end
end
