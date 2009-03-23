# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eyg_session',
  :secret      => 'ea406533dc7a2db7b465c9f2ae2c2f7d3e6a77d2ea6e61e25e2c9685c459e79932e20257cc6edcc895594120e3659a97e3ac23dd232fc5f973fa53a6301e28c0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
