# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
  $(".vote.btn-success").live 'click', (event) ->
    console.log("click")
    id = $(this).data("id")
    console.log(id)
    $.ajax '/pitches/'+id+'/vote',
      type: 'POST'
      dataType: 'json'
      success: (data) =>
        console.log("success")
        console.log(data)
        $("#votes_left").text(data.votes_left)
        $(this).removeClass("btn-success")
        $(this).addClass("btn-inverse")
        $(this).text("Voted")
        if data.votes_left == 0
          $('.btn-success.vote').parent().text("no more votes")
      error: ->
        $('.btn-success.vote').parent().text("no more votes")
