# This Class is used to detect the host Operating System and Arch 
module OperatingSystemName
  require 'rbconfig'
  
  #Define the OS Name using the builtin RbConfig method
  def self.os_name
    RbConfig::CONFIG['host_os']
  end
  #module_function :os_name
  
  #Define the OS Arch using the builtin RbConfig method
  def self.os_bits
     @os_bits ||= begin
       arch = RbConfig::CONFIG['host_os']
       if arch =~ /32/ then
         32 #32bit OS
       else
         if arch =~ /64/ then
           64 #64bit OS
       else 
         if (1<<32).class == Fixnum #32bit Ruby on 64bit OS
             64
       else
          32 #32bit OS
           end
         end
       end
     end
  end
end