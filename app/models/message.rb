# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :integer
#  speaker_id :integer
#
class Message < ApplicationRecord
end
