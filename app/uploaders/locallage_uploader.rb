class LocallageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :fog
  
  version :medium do
    # returns a 50x50 image
    process :resize_to_fill => [200, 200]
  end
  
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end
  
  
  def store_dir
    "uploads/locallage"
  end
  
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end
end
