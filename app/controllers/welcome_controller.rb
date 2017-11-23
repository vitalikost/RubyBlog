class WelcomeController < ApplicationController

 def show

 end

 def create

   @user = User.new(params.require(:email).permit(:Email,:Name,:Password))
   if @user.save
     redirect_to @user
   else
     render html:(@user.Email + " wrong email format on null Name" ).html_safe
   end
 end

 def new

 end

end
