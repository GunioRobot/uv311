# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_uv311_session',
  :secret      => 'a9bcf8c6487536ea9fb6b224e3ae0e496f29d98121fb6b909fea29dfa54f1974ba60fd352d9be5e6c123403633ca362cf81234c3b50e37c3271e36beb0ccbbf1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
