class UsersController < Frack::BaseController
  def index
    @user = User.all
    render('users/index')
  end

  def new
    @user = User.new
    render('users/new')
  end
end
