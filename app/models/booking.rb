class Booking < ActiveRecord::Base
	validate :validate_on_duration

	def duration
		((end_at - start_at) / 60).to_i
	end

	def duration_valid?
		duration >= 10 && duration <= 60
	end

	def validate_on_duration
	  if not duration_valid?
	  	err_str = "Duration should between 10 ~ 60 mins"
        errors.add(:start_at, err_str)
        errors.add(:end_at, err_str)
      end
	end
end
