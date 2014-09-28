class window.AppView extends Backbone.View

  template: _.template '
    <div id="newgame"></div>
    <div class="dealer-hand-container"></div>
    <div class="player-hand-container"></div>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
  '

  events:
    "click .hit-button": -> @model.playerHit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click #newgame": ->
      @model.newGame()
      @initialize()

  initialize: ->
    @render()
    @model.on 'win', => $('#newgame').empty().html('<div id = "win">YOU WIN!</div>')
    @model.on 'lose', => $('#newgame').empty().html('<div id = "lose">YOU LOSE!</div>')
    @model.on 'pushed', => $('#newgame').empty().html('<div id = "push">PUSH</div>')

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
