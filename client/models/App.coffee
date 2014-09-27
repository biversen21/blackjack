#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'endgame', new Endgame()
    @get('playerHand').on 'stood', =>
      @get('dealerHand').models[0].flip()
      @get('dealerHand').hit()
    @get('playerHand').on 'busted', =>
      @get('endgame').lose()
    @get('dealerHand').on 'busted', =>
      @get('endgame').win()
    @get('dealerHand').on 'stood', =>
      if @get('playerHand').scores()[0] > @get('dealerHand').scores()[0]
        @get('endgame').win()
      if @get('playerHand').scores()[0] < @get('dealerHand').scores()[0]
        @get('endgame').lose()
      if @get('playerHand').scores()[0] is @get('dealerHand').scores()[0]
        @get('endgame').pushed()
