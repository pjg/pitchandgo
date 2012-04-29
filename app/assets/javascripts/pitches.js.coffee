# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $(".vote.btn-success").live 'click', (event) ->
    id = $(this).data("id")
    $.ajax '/pitches/'+id+'/vote',
      type: 'POST'
      dataType: 'json'
      success: (data) =>
        $("#votes_left").text(data.votes_left)
        $(this).removeClass("btn-success")
        $(this).addClass("btn-inverse")
        $(this).text("Voted")
        if data.votes_left == 0
          $('.btn-success.vote').parent().text("no more votes")
          refreshVotes()
      error: ->
        $('.btn-success.vote').parent().text("no more votes")

  refreshVotes = ->
    $.getJSON '/pitches.json', (pitches) ->
      $.each pitches, (index, pitch) ->
        $('h3.votes-count[data-id=' + pitch.id + ']').text(pitch.votes_count)

  setInterval(refreshVotes, 10000)
