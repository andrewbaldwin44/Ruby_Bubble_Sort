class Sort
  def self.bubble_sort(list, &block)
    sorted = []

    #empty list when all elements have been moved to sorted
    until list.empty?
      list.each_cons(2) do |e, i|
        e_index = list.index(e)
        i_index = list.index(i)

        if block
           next if yield(e, i).negative?
        else
          next if e < i
        end

        list[e_index], list[i_index] = list[i_index], list[e_index]
      end

      sorted.unshift(list.pop) #item bubbled to end is always the largest
    end
    sorted
  end

  def self.bubble_sort_by(list, &block)
    bubble_sort(list, &block)
  end
end

p Sort.bubble_sort([2, 5, 1, 20, 15, 7])
p Sort.bubble_sort(["apples", "oranges", "xyplophone", "zebra", "cats"])

large_array = (0..999).to_a.sample(99)
p Sort.bubble_sort(large_array)

p Sort.bubble_sort_by(["hi","hello","hey"]) { |left, right| left.length - right.length}
