class Foo
   include OperatingSystemName
   if os_name == "linux-gnu" then
    puts "yes!"
   else 
    puts "Windows!"
   end
end
