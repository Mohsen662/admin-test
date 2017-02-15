class RemoveAparatIdFromEpisodes < ActiveRecord::Migration[5.0]
  def change
    remove_column :episodes, :aparat_id, :string
  end
end
