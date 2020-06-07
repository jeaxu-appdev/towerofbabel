# == Schema Information
#
# Table name: translations
#
#  id          :integer          not null, primary key
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  language_id :integer
#  message_id  :integer
#
class Translation < ApplicationRecord
end
