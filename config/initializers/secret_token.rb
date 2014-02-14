# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Blacklight::Application.config.secret_key_base = 'e1dbf5cc82e115fb30cb807d0fe35884f6888da4aebbda9a067fb306854af0e47766686c58b40f4b063e209b146a170233106e0231675776007d94901c7ae9cc'
