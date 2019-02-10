class Design < ApplicationRecord
    resourcify
    
    belongs_to :user
    
    mount_uploader :locallage, LocallageUploader
    has_many :design_attachments, dependent: :destroy
end
