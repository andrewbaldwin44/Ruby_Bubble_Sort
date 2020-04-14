class Sort
  def self.bubble_sort(array, &block)
    while true
      #equals half the array length when all is sorted
      #comparing two items at a time -> half array length
      sum_of_sorted_items = 0

      array.each_cons(2) do |e, i|
        e_index = array.index(e)
        i_index = array.index(i)

        if block
           next if yield(e, i).negative?
        else
          next if e < i
        end

        array[e_index], array[i_index] = array[i_index], array[e_index]

        sum_of_sorted_items += 1
      end
      break if sum_of_sorted_items == (array.length - 1) / 2
    end
    array
  end

  def self.bubble_sort_by(array, &block)
    bubble_sort(array, &block)
  end
end

p Sort.bubble_sort([2, 5, 1, 20, 15, 7])
p Sort.bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length}
