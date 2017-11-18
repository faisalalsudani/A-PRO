// application.js
//= require rails.validations
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

window.ClientSideValidations.callbacks.element.fail = function(element, message, callback){
  $('.submit').prop("disabled",true);
  callback();
};

window.ClientSideValidations.callbacks.element.pass = function(element, callback){
  $('.submit').prop("disabled",false);
  callback();
};
