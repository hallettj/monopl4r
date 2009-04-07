# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_monopl4r_session',
  :secret      => 'af21d6ebd6426aa1e9ce40d3898c1a28da4ee9e458c6aceca13ef3a087479c1b498ead95c74f06253833c7dc5d6e40a22cfb51b3bcc58c4f1d91a93a63dff329'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
