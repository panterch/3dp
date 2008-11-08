xml.artworkinfo do
  @category.photos.each do |photo|
    xml.albuminfo do
      xml.artLocation photo.public_filename(:gallery)
      xml.artist      photo.name
      xml.albumName   photo.description
      xml.artistLink  photo.public_filename
      xml.albumLink
    end
  end
end

  
