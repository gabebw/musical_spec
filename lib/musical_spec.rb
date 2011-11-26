require 'bloops'

require "musical_spec/note"
require "musical_spec/player"
require "musical_spec/formatter"
require "musical_spec/version"

module MusicalSpec
  # Create a singleton due to Bloopsaphone's thread wackiness.
  ONE_TRUE_BLOOPSAPHONE = Bloops.new
end
