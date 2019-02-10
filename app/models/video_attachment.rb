class VideoAttachment < ApplicationRecord
    resourcify
    
    mount_uploader :portfolio, PortfolioUploader
    belongs_to :video
end
