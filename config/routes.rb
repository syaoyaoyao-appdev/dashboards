Rails.application.routes.draw do
  get("/forex", { :controller => "currency", :action => "first_currency" })
  get("/forex/:from_currency", { :controller => "currency", :action => "second_currency" })
  get("/forex/:from_currency/:to_currency", { :controller => "currency", :action => "display_currency" })
end
