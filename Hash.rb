
#This is not used!

module Hash
  def hash_check
    require 'digest/md5'
    require 'yaml'
    config = YAML.load_file('config/hash.yaml') #Loads the config.yaml file
    $hash = config['PyHash'] #read the config file and turn the PyHash fact into a variable
    puts "Checking MD5 checksums "
    #puts @hash
    $md5 = Digest::MD5.file('/home/e58496/workspace/ruby/gnuradio-install/src/Python-2.7.8.tgz').hexdigest 
    #puts @md5
    if $hash == $md5 then
      puts "Hashes match :)"
    else
      abort("Hashes don't match!")
    end
  end
end