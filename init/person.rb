require 'af_ruby'

class Person
  attr_accessor :brain

  def initialize(brain)
    @brain = brain
  end

  def initialize_from_brain(brain)
    @brain = brain
  end
end
