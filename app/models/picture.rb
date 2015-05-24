class Picture < ActiveRecord::Base

  belongs_to :album

  mount_uploader :image, ImageUploader

  # Custom JSON response for the API
  def as_json(options={})
    {
        id: self.id,
        title: self.title,
        url: self.image.url,
        description: self.description,
        album_id: self.album.id,
        created_at:self.created_at,
        updated_at:self.updated_at
    }
  end
end
