class Design < ApplicationRecord
    mount_uploader :locallage, LocallageUploader
    has_many :design_attachments, dependent: :destroy
end
