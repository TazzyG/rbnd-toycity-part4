module UdacidataErrors
	# find(n) when the product ID can’t be found
	# destroy(n) when the product can’t be destroyed because the given ID does not exist
	class ProductNotFoundError < StandardError
	end
end
