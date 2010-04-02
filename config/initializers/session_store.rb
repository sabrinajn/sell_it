# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_SellIt_session',
  :secret      => '41cb65850dfd7837e982c8cc7001a4be31397358646cb23dcf3dd1ca7c51e9ab0d1512a4bc3ca1aa0e92f7be1369cb337a8ef7db9c38589004804ce733aad09c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
