# README

* Ruby version 2.5.3

* Rails version 5.2.2

* Database setup (no seeds yet):
```
rake db:create
rake db:migrate
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

| Avail Action | Endpoint |
|--------|----------|
| search all availabilities by date | POST /avails/search |
| read all availabilities for user | GET /users/:user_id/avails |
| read one availability for user | GET /users/:user_id/avails/:id |
| create availability for user | POST /users/:user_id/avails |
| update availability for user | PUT /users/:user_id/avails/:id |
| delete availability for user | DELETE /users/:user_id/avails/:id |

| Airport Action | Endpoint |
|--------|----------|
| read all airports | GET /airports |
| read one airport | GET /airports/:id |
