# flashbang api

Welcome to the flashbang API docs, hope you find what you are looking for here!

## User Methods

### Registration

Register a new user and receive back the new user's access key and user id.

**URL** /users/register

**Method** POST

**Request**
	

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username  | String | *(Required)*  unique username |
| fullname      | String      |  *(Required)*   User's first and last name |
| email | String      | *(Required)*   User's email (must follow format text@text.text) |
| password | String | *(Requred)* User's password


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

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| username| String | *(Required)* Existing user's username | 
| password | String | *(Required)* User's password | 

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

Authenticated users can create a new deck. 

Note: Users cannot have duplicate titles for decks they own.  However, two users can have decks with the same title.

**URL** /decks

**Method** POST

**Request**

*Required* 

***HEADERS*** : Access-Key = string

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| title| String | *(Required)* Deck title | 


**Response**

If successful, you will receive:

	Status Code: 201 - Created
	
```json
	{ "deck": 
			{ "user_id": 1,
			  "id": 3,
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

Authenticated users can list ALL decks available or only decks that they have created.

**URL** /decks

**Method** GET

**Request**

*Required* 

***HEADERS*** : Access-Key = string

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| owner| String | *(Required)* 'all' for all decks or 'mine' for decks created by the authenticated user | 

**Response**

If successful, you will receive:

	Status Code: 200 - OK
	
```json
		{"decks":	[
						{ 	
						"id":1,
						"title":"test title",
						"owner":"mans"	
						},
						{	
						"id":2,
						"title":"cats",
						"owner":"terri"	
						}
					]
		}	
```

If unsuccessful, you will receive:

	Status Code: 404 - Not Found
	
```json
	{ "errors": [ 
				"User 'cats' not found"
				] 
```

***Card Methods***

###Create

Users can create new cards within the deck.  
No card can have the same front or back.

**URL** /decks/:id/cards

**Method** post 

**Request**

*Required* 

***HEADERS*** : Access-Key = string

| Parameter        | Type           | Description  |
| ------------- |:-------------:|:----- |
| deck_id| String | *(Required)*| Deck Id | 
| front  | String | *(Required)*|Front of card|
| back   | String | *(Required)*|Back of card|

**Response**

If successful, you will receive:

```json
	{"card":
			{"id":6,
			"front":"Flashy",
			"back":"Cardy","
			deck_id":1}}
	}
```	
Status Code: 201 - Created	
	
I

If unsuccessful, you will receive:

	Status Code: 422 - Unprocessable Entity
	
```json
	{ "errors": [ 
				"Front or backside has already
				 been entered"
				] 
	}
```
