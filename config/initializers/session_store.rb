# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_conference_hub_session',
  :secret      => 'c9f9634d8790eb58737b1554ce7b6864dcdb7699acd326db618d30eb2961d19af2b0f4eb701a77932ebe0e4655a5a9d857b02c6d784563b99fded826b4184c67'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
