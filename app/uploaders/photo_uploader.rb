class PhotoUploader < BaseUploader

  version :mini_thumb do
    process resize_to_fill: [36, 36]
  end

  version :thumb do
    process resize_to_fill: [48, 48]
  end

  version :medium do
    process resize_to_fill: [90, 90]
  end


end
