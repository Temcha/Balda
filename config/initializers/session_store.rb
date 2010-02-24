# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_balda_session',
  :secret      => 'f75c07a6d0d501b7f7235b54b4127dca92826d1df9045cd5d3a590b2925430fa8d468eadb1f9fb6a55e071dd0968107d3f203e985fae2dd7f4c00f2bb8ee2dfc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
