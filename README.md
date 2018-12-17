# check-flight-backend

* An API in Ruby on Rails

* Ruby version 2.5.3

* Rails version 5.2.2

* Database setup:
```
rails db:reset
```

* Run the server (localhost:3000):
```
rails server
```

* Routes list:

| Auth Action | Endpoint |
|-------------|----------|
| signup      | POST /signup |
| login       | POST /auth/login |

POST body format (bio and rates are optional):
```
{
    "email": "name@example.com",
    "password": "password",
    "phone": "5555555555",
    "firstName": "John",
    "lastName": "Doe",
    "isExaminer": "false",
    "bio": "Lorem ipsum",
    "rates": "500"
}
```

| User Action | Endpoint |
|--------|----------|
| read all users | GET /users |
| read one user | GET /users/:id |
| update user | PUT /users/:id |
| delete user | DELETE /users/:id |

PUT body format (bio and rates are optional, can't change password):
```
{
    "email": "name@example.com",
    "phone": "5555555555",
    "firstName": "John",
    "lastName": "Doe",
    "isExaminer": "false",
    "bio": "Lorem ipsum",
    "rates": "500"
}
```

| Avail Action | Endpoint |
|--------|----------|
| search all availabilities by date | POST /avails/search |
| read all availabilities for user | GET /users/:user_id/avails |
| read one availability for user | GET /users/:user_id/avails/:id |
| create availability for user | POST /users/:user_id/avails |
| update availability for user | PUT /users/:user_id/avails/:id |
| delete availability for user | DELETE /users/:user_id/avails/:id |

POST or PUT body format:
```
{
	"date": "2018-12-16",
	"morning": false,
	"afternoon": true
}
```

POST body format for /avails/search:
```
{
	"date": "2018-12-16"
}
```

| Airport Action | Endpoint |
|--------|----------|
| read all airports | GET /airports |
| read one airport | GET /airports/:id |
| read all airports for user | GET /users/:id/airports |
| add/change airports for user | PUT /users/:id/airports |

PUT body format:
```
{
	"airports": "[1, 9, 15]"
}
```
