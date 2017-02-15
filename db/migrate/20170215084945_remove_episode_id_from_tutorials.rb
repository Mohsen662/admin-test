class RemoveEpisodeIdFromTutorials < ActiveRecord::Migration[5.0]
  def change
    remove_column :tutorials, :episode_id, :integer
  end
end
