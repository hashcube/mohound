function pluginSend(evt, params) {
  NATIVE && NATIVE.plugins && NATIVE.plugins.sendEvent &&
    NATIVE.plugins.sendEvent('MohoundPlugin', evt,
      JSON.stringify(params || {}));
}

var Mohound = Class(function() {

  this.init = function(opts) {
    logger.log('{mohound} Registering for events on startup');
  }

  this.trackPurchase = function(item, price) {
    logger.log('{mohound} Sending Payments');

    var param = {
      'item': item,
      'price': price
    };

    pluginSend('trackPurchase', param);
  }

  this.trackAction = function(name) {
    logger.log('{mohound} Sending of Event');

    var param = {
      'name': name
    };

    pluginSend('trackAction', param);
  }
});

exports = new Mohound();
