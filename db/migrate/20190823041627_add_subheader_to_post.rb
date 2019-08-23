class AddSubheaderToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :subheader, :string
  end
end
