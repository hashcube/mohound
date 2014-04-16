function pluginSend(evt, params) {
  NATIVE && NATIVE.plugins && NATIVE.plugins.sendEvent &&
  NATIVE.plugins.sendEvent("MohoundPlugin", evt,
  JSON.stringify(params || {}));
}

var Mohound = Class(function () {

  this.init = function(opts) {
    logger.log("{mohound} Registering for events on startup");
  }

  this.sendPayment = function(item, price) {
    logger.log("{mohound} Sending Payments");

    var param = {"item":item,"price":price};

    pluginSend("sendPayment",param);
  }

  this.sendEvent = function(name) {
    logger.log("{mohound} Sending of Event");

    var param = {"name":name};

    pluginSend("sendEvent",param);
  }
});

exports = new Mohound();