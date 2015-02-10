module EnvVars
  require 'yaml'
  config = YAML.load_file('config/config.yaml') #Loads the config.yaml file
  $PREFIX = config['PREFIX'] #read the config file and turn the PREFIX fact into a global variable
    
  #sets the $PATH environment variable
  def self.set_path
      ENV['PATH'] = "#{$PREFIX}/bin"":""/usr/local/sbin"":""/usr/local/bin"":""/usr/sbin"":""/usr/bin:/sbin"":""/bin"":"
      puts ENV['PATH']
  end
    
  #sets the $LD_LIBRARY_PATH environment variable
  def self.set_ldlibrarypath
    ENV['LD_LIBRARY_PATH'] = "#{$PREFIX}/lib/"":""#{$PREFIX}/lib64/"":"
    puts ENV['LD_LIBRARY_PATH']
  end
  
  #sets the $PYTHONPATH environment variable
  def self.set_pythonpath
    ENV['PYTHONPATH'] = "#{$PREFIX}/lib/python2.7/site-packages"":""#{$PREFIX}/python"":"
    puts ENV['PYTHONPATH']
  end
  
  def self.set_pkgconfigpath
    ENV['PKG_CONFIG_PATH'] = "#{$PREFIX}/lib/pkgconfig"":""#{$PREFIX}/lib64/pkgconfig"":"
    puts ENV['PKG_CONFIG_PATH']
  end
end