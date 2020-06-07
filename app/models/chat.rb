# == Schema Information
#
# Table name: chats
#
#  id                        :integer          not null, primary key
#  title                     :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  default_guest_language_id :integer
#  random_id                 :integer
#  user_id                   :integer
#
class Chat < ApplicationRecord
end
