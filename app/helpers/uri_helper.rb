require 'open-uri'

module UriHelper
	@@cache = {}
	def open_cached name, *args
		# if @@cache.include? name
		# 	if Time.now - @@cache[name].ctime < 5 * 1
		# 		logger.debug "Using cache for #{name}"
		# 		@@cache[name].rewind
		# 		return @@cache[name]
		# 	else
		# 		@@cache[name].close
		# 		@@cache[name].unlink
		# 	end
		# else
		# 	file = Tempfile.create
		# 	IO.copy_stream(URI(name).open, file)
		# 	file.rewind
		# 	@@cache[name] = file
		# 	return file
		# end
		if @@cache.include? name
			logger.debug "Using cache for #{name}"
			return @@cache[name]
		else
			res = URI(name).open.read
			@@cache[name] = res
			return res
		end
	end
end
