= InflectThis

* http://github.com/Bantik/inflect_this/tree/master
* http://www.idolhands.com/
* http://www.seologic.com/

== DESCRIPTION:

A centralized module for irregular inflections in Rails. Add to the list if you want; comment out any inflections that would interfere with any legacy tables that you might have.

== WHY?

The Rails Core team will not correct any missing singularization/pluralization exceptions, for fear of messing up people's legacy table names. Instead, they recommend adding custom inflections to your environment.rb file. In an attempt to DRY up custom inflections across the community, InflectThis provides a centralized location for collecting these custom inflections.

== NOTE:

This module does not yet check for conflicts with existing tables, models, etc. in your application. Caveat emptor.

== INSTALLATION:

* Drop it in your my_project/lib/ folder

* Include it at the top of your application controller: 

  class ApplicationController < ActionController::Base
    
    ...
    include CustomInflectors

* Customize as needed.

== CONTRIBUTING

If you find additional irregular inflections, fork the repository, add them, and do a pull request.
