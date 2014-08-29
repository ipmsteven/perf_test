require 'minitest/autorun'
require_relative 'ben'

class TestNumberFormatter < MiniTest::Unit::TestCase
  def test_number_formatter
    #[Ha, He, Hi, Hg, Ho].each do |n|
    [Haa].each do |n|
      self.class.send(:define_method, :format_currency) do |arg|
        n.format_currency arg
      end

      puts "+++++++++++++++"
      puts n
      assert_equal nil, format_currency(nil)
      assert_equal '', format_currency('')

      assert_equal "0.00", format_currency(-0)
      assert_equal "-1.00", format_currency(-1)
      assert_equal "-12.00", format_currency(-12)
      assert_equal "-123.00", format_currency(-123)
      assert_equal "-1,234.00", format_currency(-1234)
      assert_equal "-12,345.00", format_currency(-12345)
      assert_equal "-123,456.00", format_currency(-123456)
      assert_equal "-1,234,567.00", format_currency(-1234567)
      assert_equal "-12,345,678.00", format_currency(-12345678)
      assert_equal "-123,456,789.00", format_currency(-123456789)
      assert_equal "-1,234,567,890.00", format_currency(-1234567890)
      assert_equal "-12,345,678,901.00", format_currency(-12345678901)
      assert_equal "-123,456,789,012.00", format_currency(-123456789012)
      assert_equal "-0.44", format_currency(-0.44444444)
      assert_equal "-1.00", format_currency(-0.99999999)

      assert_equal "0.00", format_currency(0)
      assert_equal "1.00", format_currency(1)
      assert_equal "12.00", format_currency(12)
      assert_equal "123.00", format_currency(123)
      assert_equal "1,234.00", format_currency(1234)
      assert_equal "12,345.00", format_currency(12345)
      assert_equal "123,456.00", format_currency(123456)
      assert_equal "1,234,567.00", format_currency(1234567)
      assert_equal "12,345,678.00", format_currency(12345678)
      assert_equal "123,456,789.00", format_currency(123456789)
      assert_equal "1,234,567,890.00", format_currency(1234567890)
      assert_equal "12,345,678,901.00", format_currency(12345678901)
      assert_equal "123,456,789,012.00", format_currency(123456789012)
      assert_equal "0.45", format_currency(0.446)
      assert_equal "0.44", format_currency(0.44444444)

      assert_equal "0.00", format_currency('0.00')
      #assert_equal "0.00", format_currency('-0.00')
      assert_equal "123,456,789.00", format_currency('123456789')
      assert_equal "-123,456,789.00", format_currency('-123456789')
      assert_equal "123,456,789.44", format_currency('123456789.44444')
      assert_equal "-123,456,789.44", format_currency('-123456789.4444')

      assert_equal "0.00", format_currency(BigDecimal('0.00'))
      #assert_equal "0.00", format_currency(BigDecimal('-0.00'))
      assert_equal "123,456,789.00", format_currency(BigDecimal('123456789'))
      assert_equal "-123,456,789.00", format_currency(BigDecimal('-123456789'))
      assert_equal "123,456,789.44", format_currency(BigDecimal('123456789.4444'))
      assert_equal "-123,456,789.44", format_currency(BigDecimal('-123456789.4444'))
      puts "+++++++++++++++\n"
    end

  end
end
