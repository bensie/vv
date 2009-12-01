# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vv_session',
  :secret      => '863c52f6655aa7eb27fee0c4f6755c3ad92352a7e4166a5477dc9dd643aa8aaa115cd2b1b4783f04eac8c81d8f969e484e2b2e6c56d21cc301a452345809f297'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
