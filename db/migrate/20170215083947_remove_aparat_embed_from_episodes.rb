class RemoveAparatEmbedFromEpisodes < ActiveRecord::Migration[5.0]
  def change
    remove_column :episodes, :aparat_embed, :string
  end
end
