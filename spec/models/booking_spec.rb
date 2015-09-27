require 'rails_helper'

RSpec.describe Booking, type: :model do
	describe "#duration" do
		it "should calculate end_at - start_at in minutes" do
			start_at = Time.now
			duration = 30
			bk = Booking.create(start_at: start_at, end_at: start_at + duration.minutes)

			expect(bk.duration).to(eq(duration))
		end
	end
end
