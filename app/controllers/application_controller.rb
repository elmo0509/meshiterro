class ApplicationController < ActionController::Base
  
  # devise利用の機能が使われる場合、その前にconfigure_permitted_parametersが実行されます
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # privateは自分のコントローラ内の使用のみ
  # protectedは呼び出された他のコントローラからも参照可能
  protected
  
  def configure_permitted_parameters
    # configure_permitted_parammetersでは、divise_parameter_sanitizer.permitでnameデータ操作を許可するアクションメソッドが指定されています
    # ユーザー登録（sign_up）の際に、ユーザー名（name）データ操作が許可されます
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
