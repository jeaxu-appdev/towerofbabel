# == Schema Information
#
# Table name: speakers
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chat_id     :integer
#  language_id :integer
#  speaker_id  :integer
#  user_id     :integer
#
class Speaker < ApplicationRecord
end
