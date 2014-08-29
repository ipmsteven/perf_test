require 'benchmark'

require 'af_rails'
require 'rails/all'


I18n.enforce_available_locales = false

class He
  extend AfRails::Util::Formatters
end

class Hi
  def self.format_currency(number)
    return number if number.blank?
    ("%.2f" % number).reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
end

class Ho
  def self.format_currency(number)
    return number if number.blank?

    parts = ("%.2f" % number).split('.')
    parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
    parts.join('.')
  end
end


class Ha
  extend ActionView::Helpers::NumberHelper
  def self.format_currency(number)
    self.number_to_currency(number, :unit => '')
  end
end


iterations = 100000
result = []

result << RUBY_VERSION

af_rails = Benchmark.measure do
  iterations.times do
    He.format_currency rand(100000)
  end
end
result << "af_rails:#{"%.2f" % af_rails.total}"


ruby_regex_in_rails = Benchmark.measure do
  iterations.times do
    Hi.format_currency rand(100000)
  end
end
result << "ruby_regex_in_rails:#{"%.2f" % ruby_regex_in_rails.total}"


opt_regex = Benchmark.measure do
  iterations.times do
    Ho.format_currency rand(100000)
  end
end
result << "opt_regex:#{"%.2f" % opt_regex.total}"


rails = Benchmark.measure do
  iterations.times do
    Ha.format_currency rand(100000)
  end
end
result << "rails:#{"%.2f" % rails.total}"

File.open('ben_result', 'a') { |f|
  f.puts result.join(" ")
}
