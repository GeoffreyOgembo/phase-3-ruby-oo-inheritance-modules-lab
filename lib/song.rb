 require 'pry'

require_relative './concerns/memorable.rb'
require_relative './concerns/findable.rb'
require_relative './concerns/paramable.rb'

class Song
  attr_accessor :name
  attr_reader :artist

  @@songs = []

  def initialize
    @@songs << self
  end
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include Paramable

  def self.find_by_name(name)
    @@songs.detect{|a| a.name == name}
  end
  @@songs = []

  def self.all
    @@songs
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def artist=(artist)
    @artist = artist
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end