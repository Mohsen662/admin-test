class AddEpisodeIdToTutorials < ActiveRecord::Migration[5.0]
  def change
    add_column :tutorials, :episode_id, :integer, default: 1
  end
end
