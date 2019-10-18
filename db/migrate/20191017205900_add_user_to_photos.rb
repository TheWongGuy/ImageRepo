class AddUserToPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :qrcode
    add_reference :photos, :user, foreign_key: true
    
  end
end
