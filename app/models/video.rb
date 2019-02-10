class Video < ApplicationRecord
    resourcify
    
    belongs_to :user
    
    mount_uploader :locallage, LocallageUploader
    has_many :video_attachments, dependent: :destroy
end
