# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_thdir_session',
  :secret      => '9c28ac494dd686e7e48580f3b4a5918a71f6a6b50936875a5a754f3b78a4202c1c81bbc7e0b44b1d9052350339a81a516815b546e0d0de16af0f62d9dcc78158'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
