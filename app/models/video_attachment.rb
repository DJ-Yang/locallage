class VideoAttachment < ApplicationRecord
    mount_uploader :portfolio, PortfolioUploader
    belongs_to :video
end
