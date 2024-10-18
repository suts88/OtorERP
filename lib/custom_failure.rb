# app/lib/custom_failure.rb
class CustomFailure < Devise::FailureApp
  def redirect_url
    root_path # Hier kannst du die Route anpassen
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect_to root_path, alert: "Anmeldung fehlgeschlagen. Bitte versuchen Sie es erneut."
    end
  end
end
