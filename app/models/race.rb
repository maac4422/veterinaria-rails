# == Schema Information
#
# Table name: races
#
#  id         :integer          not null, primary key
#  name       :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Race < ApplicationRecord
	validates :name, presence: true
	paginates_per 2
	include AASM

	aasm column: "state" do
		state :active, initial: true
		state :descative

		event :active do
			transitions from: :descative, to: :active
		end

		event :descative do
			transitions from: :active, to: :descative
		end
	end


end
