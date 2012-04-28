# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
  $(".vote").click ->
    console.log("click")
    id = $(this).data("id")
    console.log(id)
    $.ajax '/pitches/'+id+'/vote',
      type: 'POST'
      dataType: 'json'
      success: ->
        console.log("success")
      error: ->
        alert("You don't have any more votes")
