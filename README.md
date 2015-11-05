# flashbang api

Welcome to the flashbang API docs, hope you find what you are looking for here!

## User Methods

### Registration

Register a new user and receive back the new user's access key and user id.

**URL** /users/register

**Method** POST

**Request**

*Required* 
	
* username = String
* fullname = String
* email = String (must follow format text@text.text)
* password = String

**Response**

If successful, you will recieve:

	Status Code: 201 - Created
	
```json
	{ "user": 
			{ "user_id": 1
			  "access_key": "biglongaccesskeyhere"
			}
	}
			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
	{"errors":[
				"Email has already been taken",
				"Username has already been taken"
				]
	}
```

### Login ###

**URL** /users/login

**Method** POST

**Request**

*Required* 

* username = String
* password = String

**Response**

If successful, you will recieve:

	Status Code: 201 - Created
	
```json
	{ "user": 
			{ "user_id": 1
			  "access_key": "biglongaccesskeyhere"
			  "username": "myusername"
			}
	}
			
```

If unsuccessful, you will receive:

	Status Code: 401 - Unauthorized
	
```json
	{ "errors": [ 
				"User or password incorrect. So sorry you aren't getting in!"
				] 
	}
```