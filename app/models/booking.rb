class Booking < ActiveRecord::Base
	belongs_to :user
	validate :validate_on_duration, :validate_no_overlap

	def duration
		((end_at - start_at) / 60).to_i
	end

	def duration_valid?
		duration >= 10 && duration <= 60
	end

	def same_day_bookings
		start_date = start_at.to_date
		Booking.where('start_at >= ? AND start_at <= ?', start_date, start_date + 1)
	end

    private

	def validate_on_duration
	  if not duration_valid?
	  	err_str = "Duration should between 10 ~ 60 mins"
        errors.add(:start_at, err_str)
        errors.add(:end_at, err_str)
      end
	end

	def validate_no_overlap
		# bk1: 3pm ~ 4pm
		# bk3: 350pm - 450pm
		# bk2: 445pm ~ 545pm
		same_day_bookings.each do |other_bk|
			if start_at <= other_bk.end_at && end_at >= other_bk.start_at
				errors.add(:start_at, "Duration should not have overlapping in same day")
			end
		end
	end
end
