class ApplicationController < ActionController::Base

  # ログインしていない状態でトップページ以外にアクセスした場合、ログイン画面にリダイレクトする
  before_action :authenticate_user!,except: [:top]

  # devise利用の機能が使われる場合、その前にconfigure_permitted_parametersが実行されます
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後は登校一覧画面い遷移する
  def after_sign_in_path_for(resource)
    post_images_path
  end

  # privateは自分のコントローラ内の使用のみ
  # protectedは呼び出された他のコントローラからも参照可能
  protected

  def configure_permitted_parameters
    # configure_permitted_parammetersでは、divise_parameter_sanitizer.permitでnameデータ操作を許可するアクションメソッドが指定されています
    # ユーザー登録（sign_up）の際に、ユーザー名（name）データ操作が許可されます
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
