class AddAparatIdToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :aparat_id, :string
    add_column :episodes, :aparat_embed, :string

  end
end
