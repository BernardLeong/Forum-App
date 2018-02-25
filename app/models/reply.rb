class Reply < ApplicationRecord
    belongs_to :discussion
    belongs_to :user
    validates :reply , presence: true 
    #User cannot post a reply unless there is something on the reply.
end
