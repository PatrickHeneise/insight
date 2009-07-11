# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_insight_session',
  :secret      => '8bbdbb72355608bd27e799fe88cfa5c762d257097d9a02c960ca9a68c6b649db23b19635ff2b6e46f3ba6c60ed870262e8885a0a288b1b4e6d748bd9078a919e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
