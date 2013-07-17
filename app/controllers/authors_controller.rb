class AuthorsController < ApplicationController

	def index 
	 @author = Author.find(:all)
	end


	def new
		@author = Author.new
	end

  def create
      @author = Author.new(params[:author])
      if @author.save
            redirect_to @author
            flash[:notice] = "Author Saved."
       else
        redirect_to new_author_path
        flash[:error] = "ERROR!!!!!!!!!"
  	
   end

   def show 
   end 
end
end

