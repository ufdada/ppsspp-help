# encoding: UTF-8
def insertLayout()
	Dir.glob('../output/*.html') do |files|
		tempFile = files + ".tmp"
		File.open(tempFile, 'w') { |file| 
			puts "Creating tmp-file #{tempFile}"
			file.write(
				# get the layout template and replace the content
				File.read('shared/layout.html').gsub('{content}', File.read(files))
			)
		}
		# now delete the markdown generated files 
		# and replace them with the new ones
		tmpFile = File.exist?(tempFile)
		
		puts "Deleting old file #{files}"
		File.delete(files)
		mdFile = File.exist?(files)
		
		writeLog("File #{files} could not be deleted") if mdFile
		writeLog("Temporary file #{file} is missing") if !tmpFile
		
		if tmpFile and !mdFile
			puts "Rename tmp-file #{tempFile} to  #{files}"
			File.rename(tempFile, files)
		end
	end
end

def writeLog(message)
	logFile = "error.log"
	puts message
	File.open(logFile, 'w') { |file| file.write(message)}
end

insertLayout()