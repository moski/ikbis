## Advance API
	There are two steps you'll need to do to authenticate your application to ikbis. First, you'll need to register your application with ikbis. Log in to ikbis as the user under whose account the messages should appear. Then go to http://ikbis.com/api/manage_keys . You will be asked to describe your application. Fill out the form and submit it. This will provide you with a client key and secret. Make note of them as you will need them for the next step.

	Then, you'll need to do the OAuth exchange, which will give you an access token and secret. Open up a terminal and run:

	    ikbis-auth