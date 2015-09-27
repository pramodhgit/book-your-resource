require 'rails_helper'

RSpec.describe Booking, type: :model do
	describe "#duration" do
		it "should calculate end_at - start_at in minutes" do
			start_at = Time.now
			duration = 30
			bk = Booking.new(start_at: start_at, end_at: start_at + duration.minutes)

			expect(bk.duration).to(eq(duration))
		end
	end

	describe "#duration_valid?" do
		it "should return whether the duration is between 10~60 minutes or not" do
			start_at = Time.now
			valid_duration = 30
			valid_bk = Booking.new(start_at: start_at, end_at: start_at + valid_duration.minutes)
			expect(valid_bk.duration_valid?).to(eq(true))

			invalid_duration = 9
			invalid_bk = Booking.new(start_at: start_at, end_at: start_at + invalid_duration.minutes)
			expect(invalid_bk.duration_valid?).to(eq(false))
		end
	end

	describe "#same_day_bookings" do
		it "should return a list of bookings in same day" do
			now = Time.new 2015, 01, 01
			bk1 = Booking.create start_at: now, end_at: now + 11.minutes
			bk2 = Booking.create start_at: now + 2.hours, end_at: now + 3.hours
			bk3 = Booking.create start_at: now + 2.days, end_at: now + 2.days + 1.hours

			same_day_bookings_ids = bk1.same_day_bookings.pluck(:id)
			expect(same_day_bookings_ids).to(include(bk2.id))
			expect(same_day_bookings_ids).not_to(include(bk3.id))
		end
	end
end
