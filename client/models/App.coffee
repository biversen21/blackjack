#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # @set 'endgame', new Endgame()
    @get('playerHand').on 'stood', =>
      @get('dealerHand').models[0].flip()
      @get('dealerHand').hit()
    @get('playerHand').on 'busted', =>
      @trigger 'busted', @
