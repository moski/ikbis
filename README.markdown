# Ikbis API GEM
	This gem implements a full-featured ruby interface for the Ikbis API.


## Installation
If you haven't already, add github's gem server to your sources:

  	gem sources -a http://gems.github.com

Then, it's as easy as:

    sudo gem install ikbis

Add the gem plugin to your Rails project by adding the following to your @environment.rb@ file:
	
	config.gem "ikbis", :lib => "ikbis"
	

## Use
There are two modules:

  	Ikbis::Simple
  	Ikbis::Advanced

## Simple API

The wrapper for the Simple API consists of the following classes and methods:

### Ikbis::Simple::User
	
	Ikbis::Simple::User.info(username, response='xml')


# Advance API 
The classes in Ikbis::Advanced must be instantiated. For example,

	  ikbis_video = Ikbis::Advanced::Video.new
	  ikbis_video.getInfo('moski_doski' , {:how => 'json'}) 

### Authentication
There are two steps you'll need to do to authenticate your application to Ikbis. First, you'll need to register your application with Ikbis. Log in to Ikbis as the user under whose account the messages should appear. Then go to http://ikbis.com/api/manage_keys. You will be asked to describe your application. Fill out the form and submit it. This will provide you with a client key and secret. Make note of them as you will need them for the next step.

Then, you'll need to do the OAuth exchange, which will give you an access token and secret. Open up a terminal and run:

    ikbis-auth

This will prompt you for the client key and secret you just obtained. It will then echo a URL which you will need to visit while still logged in to Ikbis as the user from the previous step. You'll be asked to authorize your application. Click the Authorize button, then go back to your terminal and hit Return. The script will then get the access token and secret from Ikbis, and store all four pieces of information in a file called ikbis.yml. **Don't lose this file!** It constitutes the credentials that you will need to do anything useful with Ikbis. It is not encrypted, so keep it secure. Once you have the ikbis.yml file, you will not need to do these steps again unless you de-authorize the application.	
	  	

Now to authenticate any call, you can do the following:

	ikbis_video.oauth_authentication('path_to_ikbis.yml_file')

Any call you do with this object will use the your credentials when talking to ikbis.com	
	
	
The wrapper for the Advanced API consists of the following classes and methods:

### Ikbis::Advanced::Test

	echo(options={})
  	ping(options={})
  	login(options={})




## Thanks to

* {Jeweler}[http://github.com/technicalpickles/jeweler/tree/master]: The best for gems.
* {HTTParty}[http://github.com/jnunemaker/httparty/tree/master].


## License

Copyright (C) 2008 Ikbis (http://www.ikbis.com/)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
