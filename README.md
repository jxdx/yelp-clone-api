# README

* Ruby version
```
2.7.3
```
* Rails version
```
5.2.4.6
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

* Deployment instructions
```
In order to seed the database with restaurants, reviews and users you need to fun the following tasks
in the correct order.
1) rake users:add_users
2) rake restaurants:add_restaurants
3) rake reviews:add_reviews
4) start the server by running: rails s
```

* Instructions
```
The database is seeded with restaurants, users and reviews however if you want to use this API you must first
signup to create a new user. You can use a tool such as Postman and send a Post request to the following endpoint:
http://localhost:3000/signup?email=jxdxio@gmail.com&name=Josh Davies&password=password
Upon successful creation you will be returned an auth_token, all other requests to the API must use this token as
a Bearer Token in the Authoriztion headers.

The user has the following options with the Yelp-api-clone
1) GET /restaurants to see a list of all restaurants
This endpoint purposefully leaves out restaurant details such as categories and reviews to keep this endpoint fast and response.

2) If you would like to see restaurant details such as categories and reviews simply access the following endpoint
using the business_id returned for each endpoint in the /restaurants request
http://localhost:3000/restaurants/business_id

4) If you would like to see a list of all available categories, use the following endpoint:
http://localhost:3000/categories
This endpoint will return a list of category names which can be used in the next request.

5) If you would like to see all restaurants that belong to a given category,
you can use the following endpoint:
http://localhost:3000/categories?name=Beer Gardens
where name is a param that can be passed (not it is not part of the URL so that you can send multi word names with spaces)

6) If you would like to search for keywords in reviews you can access the following endpoint:
http://localhost:3000/reviews?search_terms=Friday night
search_terms must be passed as a parameter

Note: To keep the API performant I purposefully do not return categories or reviews in any endpoint other than
the restaurant details endpoint. (/restaurants/business_id)

7) You can also create new reviews for existing restaurants as a logged in user.
You can do so by sending a POST request to:
http://localhost:3000/reviews?business_id=J8Ha6yIvGoU-E31jnCq7Ew&text=This is a test review
business_id must be that of an existing restaurant and text can be any string that you want to pass.

8) Auth tokens are valid for 24 hours, if you need to login again you can send a POST request to:
http://localhost:3000/login?email=jxdxio@gmail.com&password=password
```

* Notes:

* ...
