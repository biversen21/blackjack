#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'endgame', new Endgame()
    @get('playerHand').on 'stood', =>
      @get('dealerHand').models[0].flip()
      if @get('dealerHand').scores() < 17
        @get('dealerHand').hit()
      else
        @get('dealerHand').stand()
    @get('playerHand').on 'busted', =>
      @get('endgame').lose()
    @get('dealerHand').on 'busted', =>
      @get('endgame').win()
    @get('dealerHand').on 'stood', =>
      console.log('stood')
      if @get('playerHand').scores() > @get('dealerHand').scores()
        @get('endgame').win()
      if @get('playerHand').scores() < @get('dealerHand').scores()
        @get('endgame').lose()
      if @get('playerHand').scores() is @get('dealerHand').scores()
        @get('endgame').pushed()
