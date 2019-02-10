class DesignAttachment < ApplicationRecord
    resourcify
    
    mount_uploader :portfolio, PortfolioUploader
    belongs_to :design
end
