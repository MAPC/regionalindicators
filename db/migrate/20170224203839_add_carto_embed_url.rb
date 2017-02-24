class AddCartoEmbedUrl < ActiveRecord::Migration
  def change
    add_column :visualizations, :carto_embed_url, :string
  end
end
