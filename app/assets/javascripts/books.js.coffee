# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    $('#books').dataTable
      sPaginationType: "full_numbers"
      bJQueryUI: true

jQuery ->
    $('#liked').dataTable
      sPaginationType: "full_numbers"
      bJQueryUI: true
      
jQuery ->
    $('#suggestions').dataTable
      sPaginationType: "full_numbers"
      bJQueryUI: true
      
jQuery ->
    $('#recommend').dataTable
      sPaginationType: "full_numbers"
      bJQueryUI: true
