# flashbang api #

Welcome to the flashbang API docs, hope you find what you are looking for here!

## User Methods ##

### Registration ###

URL: /users/register

Method: POST

Required: 
	
	* username = String
	* fullname = String
	* email = String (must follow format ***@***.***)
	* password = String

If successful, you should recieve:

	Status Code: 201 - Created
	
	```json
	{ user: 
			{ user_id: 1
			  access_key: biglongaccesskeyhere
			}
	}
			
	```

If unsuccessful, you should receieve

	Status Code: 422 - Unprocessable Entity
	
	```json
	{ errors: [ "Error message 1", "Error message 2" ] }
	```

### Login ###

URL: /users/login

Method: POST
