class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	# before_action :authenticate_user!

	# ======= GET /login =======
	  def login
	    puts "\n******* login *******"
	    @user = User.new
	    @users = User.all
	  end

	  # ======= GET / =======
	  def index
	    puts "\n******* index *******"
	    @users = User.all
	  end

	  def home
	    puts "\n******* home *******"
			puts "** current_user.inspect: #{current_user.inspect}"
	  end

	  # ======= GET /show/:id =======
	  def show
	    puts "\n******* show *******"
	  end

	  # ======= GET /user/new =======
	  def new
	    puts "\n******* new *******"
	    @user = User.new
	  end

	  # ======= GET /users/:id/edit =======
	  def edit
	    puts "\n******* edit *******"
	  end

	  # ======= POST /users =======
	  def create
	    puts "\n******* create *******"
	    @user = User.new(user_params)

	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to @user, notice: 'User was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
	  end

	  # ======= PATCH/PUT /users/:id =======
	  def update
	    puts "\n******* update *******"
	    respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to @user, notice: 'User was successfully updated.' }
	      else
	        format.html { render :edit }
	      end
	    end
	  end

	  # ======= DELETE /users/:id =======
	  def destroy
	    puts "\n******* destroy *******"
	    @user.destroy
	    respond_to do |format|
	      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	    end
	  end


	private
		def user_params
			puts "******* user_params *******"
			params.require(:user).permit(:fname, :lname, :email, :email_confirmation, :username,
			:password)
		end
end
