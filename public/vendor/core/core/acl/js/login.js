/******/ (() => { // webpackBootstrap
/*!********************************************************!*\
  !*** ./platform/core/acl/resources/assets/js/login.js ***!
  \********************************************************/
function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function _classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function _defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, _toPropertyKey(o.key), o); } }
function _createClass(e, r, t) { return r && _defineProperties(e.prototype, r), t && _defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function _toPropertyKey(t) { var i = _toPrimitive(t, "string"); return "symbol" == _typeof(i) ? i : i + ""; }
function _toPrimitive(t, r) { if ("object" != _typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != _typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
var Login = /*#__PURE__*/function () {
  function Login() {
    _classCallCheck(this, Login);
  }
  return _createClass(Login, [{
    key: "handleLogin",
    value: function handleLogin() {
      $('.login-form').validate({
        errorElement: 'span',
        //default input error message container
        errorClass: 'help-block',
        // default input error message class
        focusInvalid: false,
        // do not focus the last invalid input
        rules: {
          username: {
            required: true
          },
          password: {
            required: true
          },
          remember: {
            required: false
          }
        },
        messages: {
          username: {
            required: 'Username is required.'
          },
          password: {
            required: 'Password is required.'
          }
        },
        invalidHandler: function invalidHandler() {
          //display error alert on form submit
          $('.alert-danger', $('.login-form')).show();
        },
        highlight: function highlight(element) {
          // highlight error inputs
          $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
        },
        success: function success(label) {
          label.closest('.form-group').removeClass('has-error');
          label.remove();
        },
        errorPlacement: function errorPlacement(error, element) {
          error.insertAfter(element.closest('.form-control'));
        },
        submitHandler: function submitHandler(form) {
          form.submit(); // form validation success, call ajax form submit
        }
      });
      $('.login-form input').keypress(function (e) {
        if (e.which === 13) {
          if ($('.login-form').validate().form()) {
            $('.login-form').submit(); //form validation success, call ajax form submit
          }
          return false;
        }
      });
    }
  }, {
    key: "handleForgetPassword",
    value: function handleForgetPassword() {
      $('.forget-form').validate({
        errorElement: 'span',
        //default input error message container
        errorClass: 'help-block',
        // default input error message class
        focusInvalid: false,
        // do not focus the last invalid input
        ignore: '',
        rules: {
          email: {
            required: true,
            email: true
          }
        },
        messages: {
          email: {
            required: 'Email is required.'
          }
        },
        invalidHandler: function invalidHandler() {
          //display error alert on form submit
          $('.alert-danger', $('.forget-form')).show();
        },
        highlight: function highlight(element) {
          // hightlight error inputs
          $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
        },
        success: function success(label) {
          label.closest('.form-group').removeClass('has-error');
          label.remove();
        },
        errorPlacement: function errorPlacement(error, element) {
          error.insertAfter(element.closest('.form-control'));
        },
        submitHandler: function submitHandler(form) {
          form.submit();
        }
      });
      $('.forget-form input').keypress(function (e) {
        if (e.which === 13) {
          if ($('.forget-form').validate().form()) {
            $('.forget-form').submit();
          }
          return false;
        }
      });
    }
  }, {
    key: "init",
    value: function init() {
      this.handleLogin();
      this.handleForgetPassword();
    }
  }]);
}();
$(document).ready(function () {
  new Login().init();
});
/******/ })()
;