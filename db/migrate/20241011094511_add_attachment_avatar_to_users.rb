class AddAttachmentAvatarToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      t.column   :avatar_filename,       :string
      t.column   :avatar_content_type,   :string
      t.column   :avatar_data,           :binary, :limit => 5.megabytes
    end
  end
end
