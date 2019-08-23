class AddDigestFrequencyToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :digest_frequency, :string, null: false, default: 'weekly'
  end
end
