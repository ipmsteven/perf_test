require_relative 'person'
require 'benchmark/ips'
require 'af_ruby'

class Person
  attr_accessor :brain

  def initialize_from_brain(brain)
    @brain = brain
  end
end

A = Class.new(Person)
100.times {A.include(Module.new)}

B = Class.new(Person)
1000.times {B.include(Module.new)}

C = Class.new(Person)
10000.times {C.include(Module.new)}

D = Class.new(Person)
100000.times {D.include(Module.new)}

GC.disable

Benchmark.ips do |x|
  x.report('initialize') do
    Person.new('brain')
  end

  x.report('initialize_from') do
    Person.new_from_brain('brain')
  end

  x.report('initialize_from(100 ancestors)') do
    A.new_from_brain('brain')
  end


  x.report('initialize_from(1000 ancestors)') do
    B.new_from_brain('brain')
  end

  x.report('initialize_from(10000 ancestors)') do
    C.new_from_brain('brain')
  end

  x.report('initialize_from(100000 ancestors)') do
    D.new_from_brain('brain')
  end

  x.compare!
end


#  Calculating -------------------------------------
            #initialize    28.447k i/100ms
       #initialize_from     1.007k i/100ms
#  initialize_from(100 ancestors)
                           #1.029k i/100ms
#  initialize_from(1000 ancestors)
                         #821.000  i/100ms
#  initialize_from(10000 ancestors)
                         #156.000  i/100ms
#  initialize_from(100000 ancestors)
                          #16.000  i/100ms
#  -------------------------------------------------
            #initialize      2.025M (±19.3%) i/s -      9.672M
       #initialize_from     15.578k (±16.2%) i/s -     75.525k
#  initialize_from(100 ancestors)
                           #14.740k (±16.3%) i/s -     72.030k
#  initialize_from(1000 ancestors)
                           #12.022k (±11.2%) i/s -     59.933k
#  initialize_from(10000 ancestors)
                            #2.016k (±10.7%) i/s -      9.984k
#  initialize_from(100000 ancestors)
                          #195.306  (± 5.1%) i/s -    976.000

#  Comparison:
            #initialize:  2024925.9 i/s
       #initialize_from:    15577.5 i/s - 129.99x slower
#  initialize_from(100 ancestors):    14739.6 i/s - 137.38x slower
#  initialize_from(1000 ancestors):    12022.5 i/s - 168.43x slower
#  initialize_from(10000 ancestors):     2015.9 i/s - 1004.47x slower
#  initialize_from(100000 ancestors):      195.3 i/s - 10367.97x slower
