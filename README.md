# flashbang api

Welcome to the flashbang API docs, hope you find what you are looking for here!

## User Methods

### Registration

Register a new user and receive back the new user's access key and user id.

**URL** /users/register

**Method** POST

**Request**

*Required* 
	
***Form Parameters***

* username = String
* fullname = String
* email = String (must follow format text@text.text)
* password = String

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
	{ "user": 
			{ "user_id": 1,
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

Users can get their access_key by sending a username/password.

**URL** /users/login

**Method** POST

**Request**

*Required* 

***Form Parameters***

* username = String
* password = String

**Response**

If successful, you will receive:

	Status Code: 202 - Accepted
	
```json
	{ "user": 
			{ "user_id": 1,
			  "access_key": "biglongaccesskeyhere",
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

## Deck Methods

### New

**URL** /decks

**Method** POST

**Request**

*Required* 

***HEADERS*** : Auth-Key = string

***Form Parameters***

* title = String 
* user_id = Integer

Note: Users cannot have duplicate titles for decks they own.  However, two users can have decks with the same title.

**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
	{ "deck": 
			{ "user_id": 1,
			  "owner": "terric",
			  "title": "my awesome deck"
			}
	}
			
```

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
	{ "errors": [ 
				"Title has already been taken"
				] 
	}
```

### List

**URL** /decks

**Method** GeT

**Request**

*Required* 

***HEADERS*** : Auth-Key = string

*Optional*

***Form Parameters***

* user_id = Integer

Note: If a User ID is provided, the decks returned are the decks that were created by that User

**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
```json
	{"deck":	{
				"deck_id":1,
				"owner":"man",
				"user_id":3,
				"title":"Cool Cats"
				}
	}			
```

If unsuccessful, you will receive:

	Status Code: 404 - Not Found
	
```json
	{ "errors": [ 
				"User 'cats' not found"
				] 
	}
```

