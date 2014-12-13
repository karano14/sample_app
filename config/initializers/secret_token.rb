# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = rails.root.join('.secret')
  if File.exist?(token_file)
    #Use the existiong token.
    File.read(token_file).chomp
  else
    #Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp::Application.config.secret_key_base = 'ecd187567c63a74612650bfd0cda55a661d648e1e574b4a3692a1b642eac59cab25e8b00212c3c6ebb55a7da9bfc4ef130cd7fbd413a07ad4c8eb6ec2c9b5e11'
