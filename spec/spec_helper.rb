$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'rspec'
require 'bourne'

require 'musical_spec'

RSpec.configure do |config|
  config.mock_with :mocha
end
