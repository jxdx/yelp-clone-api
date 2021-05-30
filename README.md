# README

* Ruby version
```
2.7.3
```
* Rails version
```
5.2.4.6
```

* Database version
```
Postgres 13.1
```

* Database creation
```
rake db:create
```

* Database initialization
```
rake db:migrate
```

* How to run the test suite
```
bundle exec rspec
```

* Local Deployment instructions
```
In order to seed the database with restaurants, reviews, and users
you need to run the following tasks in the correct order.
1) rake users:add_users
2) rake restaurants:add_restaurants
3) rake reviews:add_reviews
4) start the server by running: rails s
```

* Production Deployment
```
I deployed the API to AWS EC2 and RDS using Elastic Beanstalk. The server was up and running 
and connecting to the database however, after adding a new 
SECRET_KEY_BASE environment variable for JWT encoding the Elastic Beanstalk
environment is not cooperating. I have been attempting to access the logs and 
I'm also not able to access any logs.

Due to time constraints I will have to move on from this and come back if I have time.

The production URL is: Y2-env.eba-3efmssbg.us-west-2.elasticbeanstalk.com
```

* Monitoring
```
In production, once running, I will use Elastic Beanstalk logs, monitoring and alerts.
I have also used Sentry and DataDog on other projects but because of time constraints
I decided to use AWS.
```

* Instructions
```
The database is seeded with restaurants, users and reviews however,
in order to use this API you must first signup by creating a new user. 
You can use a tool such as Postman to send a POST request to the following endpoint:
http://localhost:3000/signup?email=jxdxio@gmail.com&name=Josh Davies&password=password
Upon successful creation you will receive an auth_token that is needed 
by all other requests. The token needs to be sent as
a Bearer Token in the Authoriztion headers.

The Yelp-api-clone has the following endpoints:
1) GET /restaurants to see a list of all restaurants.
This endpoint purposefully leaves out restaurant details such as categories and reviews
in order to keep it fast and responsive.
http://localhost:3000/restaurants

2) To see restaurant details such as categories and reviews simply send
a request to the following endpoint using the business_id returned with each restaurant.
http://localhost:3000/restaurants/business_id

4) To see a list of all available categories, use the following endpoint:
http://localhost:3000/categories
This endpoint will return a list of category names which can be used in the next request
to fetch all restaurants for a particular category.

5) To see a list of all restaurants that belong to a given category, 
use the following endpoint:
http://localhost:3000/categories?name=Beer Gardens
This will return a list of restaurants for a given category sorted by
the restaurant with the most reviews and highest rating.

6) To search for keywords in reviews you can access the following endpoint:
http://localhost:3000/reviews?search_terms=Friday night
This will return a list of restaurants where search_terms is part of any review
associated with the restaurant.

Note: To keep the API performant I purposefully do not return categories or reviews in any endpoint
other than the restaurant details endpoint (/restaurants/business_id).

7) You can also create new reviews for existing restaurants as a logged in user.
You can do so by sending a POST request to:
http://localhost:3000/reviews?business_id=J8Ha6yIvGoU-E31jnCq7Ew&text=This is a test review

The business_id param must be that of an existing restaurant and the text param
can be any string that you want to pass.

8) Auth tokens are valid for 24 hours, if you need to login again you can send a POST request to:
http://localhost:3000/login?email=jxdxio@gmail.com&password=password
```

* Notes and Assumptions:
```
Some of the design decisions I made are as follows:
1) Since I'm only loading the data once and I don't don't anticipate any scalability issues
at this point and time, and because it makes life quite easy to create relationships between restaurants,
users, reviews and categories, I decided to go with a Postgresql database.
2) This also allowed me to do text based queries quite easily when searching through the reviews for a supplied text.
3) I created my own indexes and foreign keys using business_id, and review_id for the relationship between
restaurants and reviews. I also joined users to reviews using user_id.
4) I created a many to many relationship between categories and relationships so that I could easily
list all restaurants that belong to a given category.
5) I debated whether to allow seeded users the ability to create reviews however, since we don't store password 
information for these users I decided to create seed without passwords to simply have data.
If you want to create a review, or access any of the endpoints, you must create a new user and then 
log in as that user first.
5) I debated whether to add JWT token authentication, this takes up a far amount of time and JWT
is something that is fairly common and its easy to implement. However, I would never create a production
API that didn't have JWT authentication or at least some kind of auth token security so I decided to implement it.
This allows the API to be more stable and maintanable.
4) For deployment and monitoring I decided to go with AWS elastic beanstalk. Since this is an assignment and
I didn't want to spend too much time on it I could have deployed using a service like Heroku but I like 
the monitoring capabilities better on AWS and the ability to create alerts.
```
