def fibs(num)
  if num == 1
    return [0]
  elsif num == 2
    return [0, 1]
  else 
    arr = [0, 1]
    num = num - 2;
    while num > 0
      sum = arr[-1] + arr[-2]
      arr << sum
      num -= 1
    end
  end
  return arr
end

def fibs_rec(idx, arr)
  if idx == 1 
    arr[0] = 0
    return 0
  elsif idx == 2
    arr[1] = 1
    return 1
  else 
    ans = fibs_rec(idx - 1, arr) + fibs_rec(idx - 2, arr)
    arr[idx - 1] = ans
    return ans
  end
end

def merge_sort(arr)
  if arr.length == 1
    return arr
  elsif arr.length == 2
    return arr[0] > arr[1] ? [arr[1], arr[0]] : arr
  else 
    first_half = merge_sort(arr.slice(0, (arr.length / 2.to_f).round))
    second_half = merge_sort(arr.slice((arr.length / 2.to_f).round, (arr.length / 2.to_f).ceil))
    sorted_arr = Array.new()
    sorted = false
    f_i = 0
    s_i = 0
    
    while !sorted
      if second_half[s_i].nil?
        sorted_arr << first_half[f_i]
        f_i += 1
      elsif first_half[f_i].nil?
        sorted_arr << second_half[s_i]
        s_i += 1
      else !second_half[s_i].nil?
        first_half[f_i] > second_half[s_i] ? sorted_arr << second_half[s_i] : sorted_arr << first_half[f_i]
        first_half[f_i] > second_half[s_i] ? s_i += 1 : f_i += 1 
      end

      if sorted_arr.length == first_half.length + second_half.length
        sorted = true
      end
    end
    
    return sorted_arr
  end
end

#iterative 
p fibs(8)

#recursive
arr = Array.new()
fibs_rec(9, arr)
p arr

#merge sort
arr2 = [5, 2, 1, 3, 6, 4]
p merge_sort(arr2)

arr3 = [8, 3, 6, 5, 1, 10, 4, 7, 2, 9]
p merge_sort(arr3)

arr4 = [8, 3, 5, 5, 1, 10, 5, 11, 2, 9, 5]
p merge_sort(arr4)