require 'bloops'

require "musical_spec/note"
require "musical_spec/player"
require "musical_spec/formatter"
require "musical_spec/version"

module MusicalSpec
  # Create a singleton due to Bloopsaphone's thread wackiness.
  ONE_TRUE_BLOOPSAPHONE = Bloops.new

  # The highest note the formatter will play. If it goes higher than this, it
  # will be normalized back down.
  HIGHEST_NOTE = Note.new('B6')

  # The lowest note this formatter will play. If it goes lower than this, it
  # will be normalized back up.
  LOWEST_NOTE  = Note.new('C2')
end
