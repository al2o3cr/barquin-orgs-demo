# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_orgs_session',
  :secret      => '32a2d4f5cd43126f1c769510037a616762ed42c46ebb6222d95b6b32b0724e1a2bd824c5edda625be2eebe11d0a049541f0f7221da1475c6fbbfff7e5d6c1e52'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
