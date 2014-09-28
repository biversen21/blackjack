#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', new Deck()
    @newGame()

  newGame: ->
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    @get('playerHand').on 'stood', =>
      @get('dealerHand').models[0].flip()
      if @get('dealerHand').scores() < 17
        @get('dealerHand').hit()
      else
        @get('dealerHand').stand()
    @get('playerHand').on 'busted', =>
      @trigger 'lose', @
    @get('dealerHand').on 'busted', =>
      @trigger 'win', @
    @get('dealerHand').on 'stood', =>
      if @get('playerHand').scores() > @get('dealerHand').scores()
        console.log(@get('playerHand').scores() + ": " + @get('dealerHand').scores())
        @trigger 'win', @
      if @get('playerHand').scores() < @get('dealerHand').scores()
        console.log(@get('playerHand').scores() + ": " + @get('dealerHand').scores())
        @trigger 'lose', @
      if @get('playerHand').scores() is @get('dealerHand').scores()
        @trigger 'pushed', @

  playerHit: ->
    if @get('dealerHand').checkBJ()
      @get('dealerHand').stand()
    else
      @get('playerHand').hit()
