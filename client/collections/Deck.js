// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Deck = (function(_super) {
    __extends(Deck, _super);

    function Deck() {
      return Deck.__super__.constructor.apply(this, arguments);
    }

    Deck.prototype.model = Card;

    Deck.prototype.initialize = function() {
      var _i, _results;
      return this.add(_((function() {
        _results = [];
        for (_i = 0; _i < 52; _i++){ _results.push(_i); }
        return _results;
      }).apply(this)).shuffle().map(function(card) {
        return new Card({
          rank: card % 13,
          suit: Math.floor(card / 13)
        });
      }));
    };

    Deck.prototype.dealPlayer = function() {
      return new Hand([this.pop(), this.pop()], this);
    };

    Deck.prototype.dealDealer = function() {
      return new Hand([this.pop().flip(), this.pop()], this, true);
    };

    return Deck;

  })(Backbone.Collection);

}).call(this);
