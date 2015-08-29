def sec_code
    code_str = rand(1..9).to_s + rand(1..9).to_s + rand(1..9).to_s
    code_ints = code_str.split('').map { |num| num.to_i }
    code_sum = code_ints.inject { |sum, n| sum + n }
    code = code_str.to_i

    puts "code is #{code}"
    puts "code integers in an array is #{code_ints}"
    puts "code adds to #{code_sum}"
end

sec_code
