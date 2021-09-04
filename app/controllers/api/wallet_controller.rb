class Api::WalletController < Api::BaseController

  def transfer
    target_user = User.find_by_email(params[:receipient])
    current_user.transfer(params[:amount].to_f, target_user)
    current_user.reload
    render_jsonapi_response(current_user)
  end

end
