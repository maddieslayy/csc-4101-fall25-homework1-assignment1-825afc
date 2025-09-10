def fib(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    arr = [0, 1]
    (n - 2).times { arr << arr[-1] + arr[-2] }
    arr[0, n]
end

def isPalindrome(n)
    s = n.to_s
    s == s.reverse
end

def nthmax(n, a)
    uniq_sorted = a.uniq.sort.reverse
    uniq_sorted[n] || nil
end

def freq(s)
    return "" if s.empty?
    counts = s.chars.tally
    counts.max_by { |k, v| v }[0]
end

def zipHash(arr1, arr2)
    return nil unless arr1.length == arr2.length
    Hash[arr1.zip(arr2)]
end

def hashToArray(hash)
    hash.keys.map { |k| [k, hash[k]] }
end
