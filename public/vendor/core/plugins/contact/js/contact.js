/******/ (() => { // webpackBootstrap
/*!*****************************************************************!*\
  !*** ./platform/plugins/contact/resources/assets/js/contact.js ***!
  \*****************************************************************/
function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function _classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function _defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, _toPropertyKey(o.key), o); } }
function _createClass(e, r, t) { return r && _defineProperties(e.prototype, r), t && _defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function _toPropertyKey(t) { var i = _toPrimitive(t, "string"); return "symbol" == _typeof(i) ? i : i + ""; }
function _toPrimitive(t, r) { if ("object" != _typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != _typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
var ContactPluginManagement = /*#__PURE__*/function () {
  function ContactPluginManagement() {
    _classCallCheck(this, ContactPluginManagement);
  }
  return _createClass(ContactPluginManagement, [{
    key: "init",
    value: function init() {
      $(document).on('click', '.answer-trigger-button', function (event) {
        event.preventDefault();
        event.stopPropagation();
        var answerWrapper = $('.answer-wrapper');
        if (answerWrapper.is(':visible')) {
          answerWrapper.fadeOut();
        } else {
          answerWrapper.fadeIn();
        }
      });
      $(document).on('click', '.answer-send-button', function (event) {
        event.preventDefault();
        event.stopPropagation();
        $(event.currentTarget).addClass('button-loading');
        var message = '';
        if (typeof tinymce != 'undefined') {
          message = tinymce.get('message').getContent();
        } else if (CKEDITOR.instances['message'] && typeof CKEDITOR.instances['message'] !== 'undefined') {
          message = CKEDITOR.instances['message'].getData();
        }
        $.ajax({
          type: 'POST',
          cache: false,
          url: route('contacts.reply', $('#input_contact_id').val()),
          data: {
            message: message
          },
          success: function success(res) {
            if (!res.error) {
              $('.answer-wrapper').fadeOut();
              if (typeof tinymce != 'undefined') {
                tinymce.get('message').setContent('');
              } else if (CKEDITOR.instances['message'] && typeof CKEDITOR.instances['message'] !== 'undefined') {
                CKEDITOR.instances['message'].setData('');
              }
              Botble.showSuccess(res.message);
              $('#reply-wrapper').load(window.location.href + ' #reply-wrapper > *');
            }
            $(event.currentTarget).removeClass('button-loading');
          },
          error: function error(res) {
            $(event.currentTarget).removeClass('button-loading');
            Botble.handleError(res);
          }
        });
      });
    }
  }]);
}();
$(document).ready(function () {
  new ContactPluginManagement().init();
});
/******/ })()
;