class Channel < ApplicationRecord
    has_many :discussions
    has_many :users, through: :discussions
    #from user can see dicussions and from discussion can see user.
end
