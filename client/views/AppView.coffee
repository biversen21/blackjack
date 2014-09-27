class window.AppView extends Backbone.View

  template: _.template '
    <div id="newgame"></div>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click #newgame": ->
      @model.newGame()
      # @model.set 'playerHand', @model.get('deck').dealPlayer()
      # @model.set 'dealerHand', @model.get('deck').dealDealer()
      # console.log @model.get('deck').length
      @initialize()


  initialize: ->
    @render()
    @model.on 'win', => $('#newgame').html('<div id = "win">YOU WIN!</div>')
    @model.on 'lose', => $('#newgame').html('<div id = "lose">YOU LOSE!</div>')
    @model.on 'pushed', => $('#newgame').html('<div id = "push">PUSH</div>')

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
