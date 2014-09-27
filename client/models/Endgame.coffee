class window.Endgame extends Backbone.Model

  win: ->
    @set 'results', 'win'
    @endgame()

  lose: ->
    @set 'results', 'lose'
    @endgame()

  pushed: ->
    @set 'results', 'push'
    @endgame()

  endgame: ->
    new EndgameView({model: @})
