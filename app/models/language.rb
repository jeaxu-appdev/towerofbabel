# == Schema Information
#
# Table name: languages
#
#  id              :integer          not null, primary key
#  code            :string
#  name            :string
#  name_in_english :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Language < ApplicationRecord
  validates :code, :uniqueness => true
end
