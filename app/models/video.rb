class Video < ApplicationRecord
    mount_uploader :locallage, LocallageUploader
    has_many :video_attachments, dependent: :destroy
end
