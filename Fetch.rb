#Downloads the needed src files
module Fetch
  class Fetch_src
    require 'digest/md5'
    require 'yaml'
    require 'fileutils'
  
    #The programs root running dir.
    @root = Dir.pwd
    #Loads the config.yaml file
    config = YAML.load_file('config/packages.yaml')
    @gr_version = config['GR_VERSION']
    @packages = %w[http://gnuradio.org/releases/gnuradio/gnuradio-3.7.4.tar.gz http://ca85w-lincoln.atk.com/source/boost_1_56_0.tar.gz]

    #Downlaods the needed src files via wget using the system() call.
    def self.fetch_src(fetch_list)
      config = YAML.load_file("#{@root}/config/config.yaml") #Loads the config.yaml file
      username = config['USERNAME'] #read the config file and turn the PyHash fact into a variable
      passwd = config['PASSWD'] #read the config file and turn the PyHash fact into a variable

      #Use wget to download source tarballs
      fetch_cmd = "wget --user=#{username} --password=#{passwd} -nc --no-check-certificate "
      @src_dir = 'src/'
      Dir.chdir(@src_dir)
      #Interates through the fetch_list array and downloads the packages if not already present.
      fetch_list.each { |f| system(fetch_cmd + f) }
    end

    def self.hash_check(package, hash)
      puts "Checking MD5 checksum for  #{package}"
      md5 = Digest::MD5.file("#{@root}/#{@src_dir}/#{package}").hexdigest
      if hash == md5
        puts 'The file hash is good'
      else
        abort("Hashes don't match")
      end
    end

    def self.unpack_src
      puts 'unpacking...'
      unpack_list = %w[ gnuradio-3.7.4.tar.gz boost_1_56_0.tar.gz ]
      unpack_cmd = 'tar -xf  '
      unpack_list.each { |f| system(unpack_cmd + f) }
    end

    fetch_src(@packages)
    hash_check('gnuradio-3.7.4.tar.gz', '94e7115ad7b46b5bc9e0b336cf74d8ba')
    hash_check('boost_1_56_0.tar.gz', '8c54705c424513fa2be0042696a3a162' )
    #unpack_src

  end
end
