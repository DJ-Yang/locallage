class LocallageUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "uploads/locallage"
  end
end
