password = "abcdef#"

if password.length >= 8 && password.include?("#")
  puts "Got it. Your password is: #{password}"
elsif password.length < 8
  puts "The password '#{password}' is invalid. The password must contain 8 characters or more"
elsif !password.include?("#")
  puts "The password '#{password}' is invalid. The password must include a hashtag character (#)"
end

