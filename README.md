Ping Pong Table Booking App
===========================

Basic functionalities (Implemented and tested):

1) Booking durations are in minutes, and can be anything from 10min to 60min.

2) Anyone can book the table, but must have at least 60min interval between each of their bookings.

3) No overlaps between bookings.

Added functionalities (Implemented and tested):

1) Users can sign up and login to book.

Potential issues to work on:

1) User should only be able to edit his/her own booking. Right now, it's an honor based system where people can edit one another's bookings.

2) Allow user to edit his/her account details i.e. reset password. (Need to work on Devise views)

3) Set up mailer using mailchimp/mandrill to remind user of his/her booking or when booking is made.

4) Right now, booking can be made on a strict time basis. E.g.: If end time of booking 1 is at 4:00pm, the start time of next booking needs to be from 4:01pm. 