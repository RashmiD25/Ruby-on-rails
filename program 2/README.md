# CSC/ECE 517 Fall 2023 Program 2

Welcome to Train Ticket Booking System. The developers are:

* Swastik Ghosh (sghosh25@ncsu.edu)
* Arpit Choudhury (achoudh8@ncsu.edu)
* Rashmi Datta (rdatta2@ncsu.edu)

# Deployment

The app is deployed on VCL. You can access the server at http://152.7.178.120:8080/. The server will remain operational until Saturday, October 21, 2023, 06:30PM EDT.

# Setup

The application can have only one admin, but many passengers. The Ruby version used is 3.2.2 and the Rails version is 7.0.8

# Admin Setup

| Email-address | Password |
| ---------| -------- |
| admin | admin |

## User Setup

The application has been populated with 2 passengers to test various features.


| Email-address | Password |
| ---------| -------- |
| passenger1@pass.com | passenger |
| passenger2@pass.com | passenger |

# Navigation
*Preconditions*: Current user is logged in as either admin or passenger.
## Admin
### Features 
* From home page, click **Edit Profile**. Current Admin details are printed and gives an option to *edit* the admin. Only email, Phone number, address and credit card number of admin are allowed to be updated. 
* From home page, click **View Passengers** to be presented a list of all passengers/users who have signed up for the website. By then clicking **Show**, one is presented with details of the selected passenger. Admin gets to *edit* all the fields of the passenger as well as *destroy* the passenger. 
* **Back to Home** and **Admin Home** takes you back to the Damin home page.
* From home page, click **View Trains** to view a list of all trains on the website with the following details:
  * All trains would be displayed with the following fields:
    * train number, departure station, termination station, departure date, departure time, arrival date, arrival time, ticket price, number of seats left, link to train and link to buy a ticket on that train
  * Admin also has the capability of creating a new train, by clicking the **New train** link.
  
* From home page, click **View Trains** to list the trains which are departing starting today and which have seats left in them.
  * This allows users (admin as well as passenger), to check for trains to travel and then book a ticket alongside.
  
* To book a ticket, we can also go from home page, click **View Tickets** , then **New ticket** at the bottom after listing all the booked tickets list.
  * Need to just enter **train id** since **passenger id** and **confirmation number** are autopolulated, to create a ticket.
    * We have also provided another link below **View trains HERE to get train ID** so that user can easily select a valid train Id from the list provided.
    * Tickets are capped to 100 and depending on the train selected and the number of tickets, once create ticket is clicked, if the tickets are successfully booked the price is shown on the screen along with the confirmation message.
* From home page, click **View Review** to list all reviews. 
* On the same page, you can also see List of reviews written by a specific user and List of reviews written for a specific train, clicking on each will redirect to all the details.
* We can also see List of trains with more than average(>3) rating by navigating to **View Trains** from the home page, below the all trains list.
* From home page, click **Log out** to log out of the application.

## Passenger
### Requirements
* From home page, click **Edit Account**. User details is displayed before being displayed the option to *edit* or *destroy*.
* From **View Tickets** on the home page, click **Trip History** to get a list of the passenger's booking history.
* From home page, click **View Reviews** to list reviews written by the current logged-in passenger. 
  * Can create a **New Review** from the link provided below the list of existing reviews.
  * Can also see the details of the reviews by clicking on **Show** beside each review, after which the review can be edited as well as destroyed.
* From home page, click **View Trains** to list the trains which are departing starting today and which have seats left in them.
  * This allows user to check for trains to travel and then book a ticket simultaneously as well as from the home page.
* To book a ticket, user needs to just enter **train id** since **passenger id** and **confirmation number** are autopolulated, to create a ticket.
    * We have also provided another link below **View trains HERE to get train ID** so that user can easily select a valid train Id from the list provided.
    * Tickets are capped to 100 and depending on the train selected and the number of tickets, once create ticket is clicked, if the tickets are successfully booked the price is shown on the screen along with the confirmation message.
* From home page, click **View Review** to list all reviews. 
* On the same page, you can also see List of reviews written by a specific user and List of reviews written for a specific train, clicking on each will redirect to all the details.
* We can also see List of trains with more than average(>3) rating by navigating to **View Trains** from the home page, below the all trains list.
* From home page, click **Log out** to log out of the application.



