Rails.application.routes.draw do
  # Routes for the Translation resource:

  # CREATE
  post("/insert_translation", { :controller => "translations", :action => "create" })
          
  # READ
  get("/translations", { :controller => "translations", :action => "index" })
  
  get("/translations/:path_id", { :controller => "translations", :action => "show" })
  
  # UPDATE
  
  post("/modify_translation/:path_id", { :controller => "translations", :action => "update" })
  
  # DELETE
  get("/delete_translation/:path_id", { :controller => "translations", :action => "destroy" })

  #------------------------------

  # Routes for the Message resource:

  # CREATE
  post("/insert_message", { :controller => "messages", :action => "create" })
          
  # READ
  get("/messages", { :controller => "messages", :action => "index" })
  
  get("/messages/:path_id", { :controller => "messages", :action => "show" })
  
  # UPDATE
  
  post("/modify_message/:path_id", { :controller => "messages", :action => "update" })
  
  # DELETE
  get("/delete_message/:path_id", { :controller => "messages", :action => "destroy" })

  #------------------------------

  # Routes for the Speaker resource:

  # CREATE
  post("/insert_speaker", { :controller => "speakers", :action => "create" })
          
  # READ
  get("/speakers", { :controller => "speakers", :action => "index" })
  
  get("/speakers/:path_id", { :controller => "speakers", :action => "show" })
  
  # UPDATE
  
  post("/modify_speaker/:path_id", { :controller => "speakers", :action => "update" })
  
  # DELETE
  get("/delete_speaker/:path_id", { :controller => "speakers", :action => "destroy" })

  #------------------------------

  # Routes for the Chat resource:

  # CREATE
  post("/insert_chat", { :controller => "chats", :action => "create" })
          
  # READ
  get("/chats", { :controller => "chats", :action => "index" })
  
  get("/chats/:path_id", { :controller => "chats", :action => "show" })
  
  # UPDATE
  
  post("/modify_chat/:path_id", { :controller => "chats", :action => "update" })
  
  # DELETE
  get("/delete_chat/:path_id", { :controller => "chats", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
