class DesignAttachment < ApplicationRecord
    mount_uploader :portfolio, PortfolioUploader
    belongs_to :design
end
