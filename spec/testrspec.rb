# test spec/test

require_relative '../lib/enumerables'

describe Enumerable do
  # testing my_each method
  describe '#my_each' do
    it 'return every value' do
      expect([5, 12, 6].my_each { |i| i }).to eql([5, 12, 6])
    end
    it 'return not equal to every value' do
      expect([5, 12, 6].my_each { |i| i }).not_to eql([7, 12, 6])
    end
  end
  # testing my_each_with_index method

  describe '#my_each_with_index' do
    array = [5, 12, 6]
    it 'return enum when no block is given' do
      expect(array.my_each_with_index).to be_a(Enumerator)
    end
    it 'return array when a block is given' do
      expect(array.my_each_with_index { |a, b| }).to eql(array)
    end
  end

  # testing my_select

  describe '#my_select' do
    it 'return odd number' do
      expect([1, 3, 2, 8, 11, 15].my_select(&:odd?)).to eql([1, 3, 11, 15])
    end
  end

  # testing my_all?

  describe '#my_all?' do
    it 'return true if all numbers are greater than 0' do
      expect([1, 5, 2, 8, 11, 15].my_all?(&:positive?)).to eql(true)
    end

    it 'return false if at least one of numbers is not greater than 0' do
      expect([1, -3, 2, 8, 11, 15].my_all?(&:positive?)).to eql(false)
    end
  end

  # testing my_none

  describe '#my_none?' do
    it 'return false at least one numbers is greater than 0' do
      expect([1, 5, 2, 8, 11, 15].my_any?(&:positive?)).to eql(true)
    end

    it 'return true if none of numbers is  greater than 15' do
      expect([1, -3, 2, 8, 11, 15].my_all?(&:positive?)).to eql(false)
    end
  end

  # testing my_any

  describe '#my_any?' do
    it 'return true at least one numbers is greater than 0' do
      expect([1, 5, 2, 8, 11, 15].my_any?(&:positive?)).to eql(true)
    end

    it 'return false if none of numbers is  greater than 15' do
      expect([1, -3, 2, 8, 11, 15].my_all?(&:positive?)).to eql(false)
    end
  end

  # testing my_map

  describe '#my_map' do
    it 'return all numbers added by 10' do
      expect([1, 5, 2, 8, 11, 15].my_map { |x| x + 10 }).to eql([11, 15, 12, 18, 21, 25])
    end
  end

  # testing my_count

  describe '#my_count' do
    it 'return how many number is even' do
      expect([1, 5, 2, 8, 11, 15].my_count(&:even?)).to eql(2)
    end

    it 'return number of string with length greater tha 2' do
      strings = %w[a bb donat xx xxx]
      expect(strings.my_count { |x| x.size > 2 }).to eql(2)
    end
  end

  # testing multiply_els

  describe '#multiply_els' do
    it 'Returns the multiplication of all elements in the array' do
      expect(multiply_els([3, 5, 2])).to eql([3, 5, 2].inject { |x, y| x * y })
    end

    # testing my_inject

    describe '#my_inject' do
      it 'return sum of all numbers' do
        expect([1, 5, 2].my_inject { |total, n| total + n }).to eql(8)
      end
    end
  end
end
