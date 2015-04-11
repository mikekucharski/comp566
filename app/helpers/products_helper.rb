module ProductsHelper

	def getImageName(product)
		return "#{product.brand.name}_#{product.category.name}#{product.imageNum}.jpg".downcase
	end
end
