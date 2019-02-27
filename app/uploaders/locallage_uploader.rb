class LocallageUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "uploads/locallage"
  end
  
  # def filename
  #   "#{model.id}" # to name file with their id
  # end
  
end
