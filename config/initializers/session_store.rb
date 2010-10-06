# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_articley_session',
  :secret      => 'eee5f752ae80895d3d44b95b5e8e78f1c04009af0cdb39bf7754faddca8044507e8f0c321b8b1a7df64b8d6a91a67f1f7e1370a77e15d5540d772e39d71dc132'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
