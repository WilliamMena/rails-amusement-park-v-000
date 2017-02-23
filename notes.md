Need to create a root page

  In our root page we need to have a 'sign up' link, 'sign in' and 'sign out' link.
  Leave the 'sign out' for last so we can get #current_user working.

  sign_up == user#new
      has option to make admin or not
      user#create then EITHER sign the user in and redirect_to 'home page' OR redirect_to sign_in route

  sign_in == session#new
      session#create redirect_to 'home page'


