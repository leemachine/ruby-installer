class Build
  require 'yaml'
  require 'Fetch.rb'
  require 'EnvVars.rb'

    #Build Python
  def python_build
    Dir.chdir("#{@root}/src/")
    if File.directory?("#{$PYTHONVERSION}/") then
      Dir.chdir("Python-2.7.8/")
    else
      puts "Python source does not exist "      
    end
   system("./configure --enable-shared --prefix=#{$PREFIX} ")
   system("make && make install ")
  end
  
  def cheetah_build
    Dir.chdir("#{$ROOT}/src/")
    if File.directory?("#{$CHEETAH_VERSION}/") then
      Dir.chdir("Cheetah-2.4.4/")
    else
      abort("Cheetah source does not exist ")      
    end
    system('python --version') ; @PYTHONVERSION = "Python 2.7.8" 
    if @PYTHONVERSION == "Python 2.7.8" 
   system("python setup.py build ")
   system("python setup.py install ")
    else
      abort("Wrong Python")
    end  
  end
end