class Discussion < ApplicationRecord

    belongs_to :channel
    belongs_to :user
    has_many :replies, dependent: :destroy 
    #dependent destroy mean if discussion is delete, so are the replies.
    validates :title, :content, presence: true
    
end
