class LocallageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :fog
  
  version :medium do
    # returns a 50x50 image
    process :my_resize => [600, 400]
  end
  
  version :personal do
    process :resize_to_limit => [640, 500]
  end
  
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end
  
  def my_resize(width, height)
    manipulate! do |img|
      img.resize "#{width}x#{height}!"
      img
    end
  end
  
  
  def store_dir
    "uploads/test"
    # "uploads/locallage"
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
