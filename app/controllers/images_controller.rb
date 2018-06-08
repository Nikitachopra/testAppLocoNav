class ImagesController < ApplicationController


  def new
		@image = Image.new
	end

	def create
		
		Image.create(
			avatar: params[:image][:avatar],
			name: params[:image][:name],
			user: current_user,
			tag_list: Array(params[:image][:tag_list])
		)
		redirect_to action: "index"
	end

	def index
		@count = 5
		@page = params[:page].blank? ? 1 : params[:page].to_i
		@max_pages = Image.all.length/@count

  		@images = Image.offset((@page - 1) * @count).limit(@count).reverse

  	end

  def search
  	@image = Image.tagged_with(params[:query], :on => :tags).reverse
  	@count = 5
  	@max_pages = @image.length/@count
  	@page = params[:page].blank? ? 1 : params[:page].to_i
  	@images = Image.offset((@page - 1) * @count).limit(@count).reverse

  end

  def edit
		@image = Image.find(params[:id])
	end

	def update
		Image.update(
			name: params[:image][:name],
			user: current_user,
			tag_list: Array(params[:image][:tag_list])

			)
		
	end

	def delete
	end
end
