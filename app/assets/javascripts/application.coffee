# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.

# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.

# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.

# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.

# = require jquery
# = require jquery_ujs
# = require turbolinks
# = require_tree .


recursiveReplace = (node, translator) ->
  if node.nodeType is 3    # text node      
    node.nodeValue = translator.translate node.nodeValue
  else if node.nodeType is 1
    $(node).contents().each -> recursiveReplace @, translator        

vonnify_text = ->
  vonny = new Vonnyficator

  recursiveReplace document.body, vonny


$(document).ready vonnify_text
$(document).on 'page:load', vonnify_text  