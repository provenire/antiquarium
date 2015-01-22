class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'jpg'
  process tags: ['antiquarium', 'page']

  version :large do
    process eager: true
    cloudinary_transformation 'page_large'
  end

  version :normal do
    process eager: true
    cloudinary_transformation 'page_normal'
  end

  version :thumbnail do
    process eager: true
    cloudinary_transformation 'page_thumbnail'
  end

  version :index do
    process eager: true
    cloudinary_transformation 'index'
  end

  version :show do
    process eager: true
    cloudinary_transformation 'show'
  end

end
