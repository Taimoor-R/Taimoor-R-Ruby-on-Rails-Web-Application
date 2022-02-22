# README
An Ecommerces Website, built on an agile framework(Ruby On Rails).

Configuration

Dev Env:
- Ubuntu 20.04
- Ruby version: 2.5.1p57
- Rails version: 5.2.6 d
- Database: sqlite

Scope:
1. Views:
    - A home page and a contact page with a contact form.
    - Resource pages for all of your appropriate model resources. Only providing
      routes and actions to all of your resource paths if required.
    - All views conforming to best practice guidelines for HTML5 and CSS. Use of Boiler Plate code.
    - Partials used to ensure that each page has a standardised header and footer.  
    - jQuery used where appropriate to assist in providing a good user experience. 
    - Admin and Client Access and differentiators
    - Implementation of a Cart 
    -  Appropriate testing for each view.
 
2. Controllers:
    - Homepage and Contact page controllers.
    - Controllers for each of model resources with the use of
      strong parameters.
    - Appropriate testing for each of your controller actions. 
    
3. Mailer:
    - A mailer to handle your contact request. This does not need to be linked to
      an SMTP server.
    - Appropriate testing for each of your Mailer actions. 
    
4. Models:
    - Various models applied.
       - User
       - Cart
       - Line Item
       - Product
       - Orders
    - Appropriate testing for each model.

5. External Gems used:
 - 'devise', '~>4.7', '>=4.7.1'
 - 'devise-bootstrapped', github: 'king601/devise-bootstrapped', branch: 'bootstrap4'
 - 'simple_form'
 - 'chartkick'
 - 'groupdate'

6. Login into WebApp(Devise Logins):
    For Admin Functionality: 
     - Email: taimoorriz@gmail.com
     - Password: 1234asdf
    For User Functionality:
     - Email: timmy@gmail.com
     - Password: 1234asdf
     - Further information regarding admin and user can be changed in seed.rb if these emails and passwords for unforseen reasons don't work. More users(Non-            Admin) can also be generated form the webpage itself.
