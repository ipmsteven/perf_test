require 'gruff'
result = []

File.open("ben_result", "r") do |f|
  f.each_line do |line|
    result << line.split[1..-1]
  end
end


a = result.transpose
puts a.inspect


g = Gruff::Line.new
g.title = 'Ben'
g.labels = { 0 => 'ree', 1 => '1.9.3', 2 => '2.0.0', 3 => '2.1.2' }
g.data :af_rails,  a[0].map(&:to_f)
g.data :rubyRegex, a[1].map(&:to_f)
g.data :rails,     a[2].map(&:to_f)

g.write('exciting.png')
