require 'find'
require 'fileutils'
require "readline"

$source=ARGV[0]
$yui="C:\\Users\\Public\\Documents\\yui.jar"
Find.find($source) do |file|
  #  if file=~/s\/kissy/ 
  #  else
  if file=~/\.js$/
    if file=~/\.source\.js$/
      IO.popen(" java -jar "+$yui+" --type js --charset utf8 -o "+file.gsub(/\.source\.js/,".js")+"  "+file ) { |f| puts "converting..."+file}
      $ffs=File.new(file.gsub(/\.source\.js/,".js"),"a")
      $ffs.puts "\n/** compress timestamp:"+Time.now.to_s+"**/"
      $ffs.close
    end
  else if file=~/\.css$/
      if file=~/\.source\.css$/
        IO.popen(" java -jar "+$yui+" --type css --charset utf8 -o "+file.gsub(/\.source\.css/,".css")+"  "+file ) { |f| puts "converting..."+file}
        $ffs=File.new(file.gsub(/\.source\.css/,".css"),"a")
        $ffs.puts "\n/** compress timestamp:"+Time.now.to_s+"**/"
        $ffs.close
      end
    end
  end
  # end
end

puts "develop by ued@tianpin.com!version:1.2!";
Readline.readline("Ñ¹ËõÍê±Ï£¬Çë¹Ø±Õ±¾´°¿Ú> ", true)

