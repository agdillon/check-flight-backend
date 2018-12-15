# check-flight-backend

* An API in Ruby on Rails

* Ruby version 2.5.3

* Rails version 5.2.2

* Database setup:
```
rake db:create
rake db:migrate
rake db:seed
```

* Run the server (localhost:3000):
```
rake server
```

* Routes list:

| User Action | Endpoint |
|--------|----------|
| read all users | GET /users |
| read one user | GET /users/:id |
| create user | POST /users |
| update user | PUT /users/:id |
| delete user | DELETE /users/:id |

POST or PUT body format (bio and rates are optional):
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
