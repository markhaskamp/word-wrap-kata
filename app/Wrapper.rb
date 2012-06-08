# When recurring on a number, ask 1) 0? and 2) else
# Always change at least one argument while recurring.
# It must be changed to be closer to termination.
# The changing argument must be tested in the termination condition.


class Wrapper
  def wrap str, max
    final_str = ""

    foo = get_first_split(str, max)
    first_cut = foo[0]
    remaining_str = foo[1]

    while (remaining_str != "") do
      final_str += first_cut + "\n"
      foo = get_first_split(remaining_str, max)
      first_cut = foo[0]
      remaining_str = foo[1]
    end
    
    final_str += first_cut
  end

  def get_first_split str, max

    if str.length < max then
      a = str
      b = ""
    else
      ndx = get_split_index(str, max)
      a = (str.slice(0, ndx)).chomp
      b = str.slice(ndx, str.length).lstrip
    end
   
    # puts "a,b: #{[a,b]}"
    return [a,b]
  end

  def get_split_index str, max
    return max if str[max] == ' '
    ndx = 0
    last_space_ndx = max
    str.chars do |c|
      last_space_ndx = ndx if c == ' '
      
      ndx += 1
      return last_space_ndx if ndx == max
    end

    return last_space_ndx
  end

end

