/**
 * @preserve jQuery Dialog plugin v1.0.3
 * (c) 2015, Chupurnov Valeriy <chupurnov@gmail.com>
 */
(function ($) {
    'use strict';
	var plugin_name = 'dialog',
		tpl_button = '<button class="xdsoft_btn" type="button"></button>',
		tpl_dialog = '<div class="xdsoft_dialog xdsoft_dialog_shadow_effect">' +
				'<div class="xdsoft_dialog_popup_title">' +
					'<span></span>' +
					'<a class="xdsoft_close">&times;</a>' +
				'</div>' +
				'<a class="xdsoft_close">&times;</a>' +
				'<div class="xdsoft_dialog_content">' + '</div>' +
				'<div class="xdsoft_dialog_buttons">' + '</div>' +
			'</div>',

		default_options = {
			title: false,
			buttons: {},
			closeFunction: 'fadeOut',
			showFunction: 'fadeIn',
			closeBtn: true,
			closeOnClickOutside: true,
			closeOnEsc: true,
			clickDefaultButtonOnEnter: true,
			zIndex: 10,
			modal: true,
			shown: true,
			removeOnHide: true,
			hideGlobalScrollbar: true,
			onBeforeShow: function () {},
			onBeforeHide: function () {},
			onAfterShow: function () {},
			onAfterHide: function () {}
		};

	function createCallbackHandler(callback, dialog_box) {
		return function (event) {
			if (!callback || callback.call(dialog_box, event, this) !== false) {
				dialog_box[plugin_name]('hide');
			}
		};
	}

	function makeButtons(buttons, tpl_button, buttons_box, dialog_box) {
		var title, btn, k = 0;

		if (buttons !== undefined) {
			buttons_box
				.empty();
		}
		if (buttons && $.isPlainObject(buttons)) {
			for (title in buttons) {
				if (buttons.hasOwnProperty(title)) {
					if (buttons[title] instanceof $) {
						btn = buttons[title];
					} else {
						btn = $(tpl_button).html(title);

						if (!k) {
							btn.addClass('xdsoft_primary');
						}

						btn.click(createCallbackHandler($.isFunction(buttons[title]) ? buttons[title] : ((buttons[title].click && $.isFunction(buttons[title].click)) ? buttons[title].click : false), dialog_box));

						if ($.isPlainObject(buttons[title])) {
							if (buttons[title].className) {
								btn.addClass(buttons[title].className);
							}

							if (buttons[title].primary) {
								buttons_box.find('button')
									.removeClass('xdsoft_primary');
								btn
									.addClass('xdsoft_primary');
							}

							if (buttons[title].title) {
								btn = btn.html(title);
							}
						}
					}

					buttons_box.append(btn);
					k += 1;
				}
			}
		}
	}

	function makeTitle(text, title, dialog_box, options) {
		if (!text && text !== '') {
			title.hide();
			dialog_box.find('div.xdsoft_dialog>.xdsoft_close').show();
		} else {
			dialog_box.find('div.xdsoft_dialog>.xdsoft_close').hide();
			title
				.show()
				.find('span')
					.html(text);
		}
		if (!options.closeBtn) {
			dialog_box.find('.xdsoft_close').hide();
		}
	}
	function hasScroll(el) {
		var direction = 'scrollTop',
			result = !!el[direction];

		if (!result) {
			el[direction] = 1;
			result = !!el[direction];
			el[direction] = 0;
		}
		return result;
	}
	function getScrollbarWidth() {
		var outer = document.createElement("div"),
			widthNoScroll,
			inner,
			widthWithScroll;
		outer.style.visibility = "hidden";
		outer.style.width = "100px";
		outer.style.msOverflowStyle = "scrollbar"; // needed for WinJS apps
		document.body.appendChild(outer);
		widthNoScroll = outer.offsetWidth;
		outer.style.overflow = "scroll";
		inner = document.createElement("div");
		inner.style.width = "100%";
		outer.appendChild(inner);
		widthWithScroll = inner.offsetWidth;
		outer.parentNode.removeChild(outer);
		return widthNoScroll - widthWithScroll;
	}
	$.fn[plugin_name] = function (_options, second, third) {
		var	that = this,
			dialog_box = that,
			options = $.extend(true, {}, default_options, $.isPlainObject(_options) ? _options : {}),
			dialog = dialog_box.find('.xdsoft_dialog'),
			buttons_box = dialog_box.find('.xdsoft_dialog_buttons'),
			event;

		if (dialog_box.hasClass('xdsoft_dialog_overlay') && dialog_box.data('options')) {

			options = dialog_box.data('options');

			if ($.type(_options) === 'string' && _options.length) {
				_options = _options.toLowerCase();
				_options = _options.charAt(0).toUpperCase() + _options.slice(1);
				event = $.Event('before' + _options + '.xdsoft');
				dialog_box.trigger(event);
				if (options['onBefore' + _options] && $.isFunction(options['onBefore' + _options])) {
					options['onBefore' + _options].call(that, options, _options);
				}
				if (!event.isDefaultPrevented()) {
					switch (_options.toLowerCase()) {
					case 'resize':
						if (dialog_box.is(':visible')) {
							dialog_box.css('zIndex', options.zIndex);
							if (!options.modal) {
								dialog_box.removeClass('xdsoft_modal');
								dialog.css('margin-left', '-' + Math.round(dialog.width() / 2) + 'px');
							}
						}
						break;
					case 'ok':
						if (dialog_box.is(':visible')) {
							if (second !== 'enter' || options.clickDefaultButtonOnEnter) {
								buttons_box.find('.xdsoft_primary').trigger('click');
							}
							if (second === 'enter' && options.clickDefaultButtonOnEnter && third) {
								third.stopPropagation();
								third.preventDefault();
							}
						}
						break;
					case 'hide':
						if (dialog_box.is(':visible')) {
							if (second !== 'esc' || options.closeOnEsc) {
								dialog_box.stop()[options.closeFunction](function () {
									if (options.removeOnHide) {
										dialog_box.remove();
									}
									if (options.modal && options.hideGlobalScrollbar && !$('.xdsoft_dialog_overlay:visible').length) {
										$('html').removeClass('xdsoft_overlay_lock').removeClass('xdsoft_overlay_lock_offset');
										$('html')
											.css('margin-right', 0);
									}
									dialog_box.trigger('after' + _options + '.xdsoft');
									if (options['onAfter' + _options] && $.isFunction(options['onAfter' + _options])) {
										options['onAfter' + _options].call(that, options, _options);
									}
									if (dialog_box.data('resize_interval')) {
										clearInterval(dialog_box.data('resize_interval'));
									}
								});
								if (second === 'esc' && options.closeOnEsc && third) {
									third.stopPropagation();
									third.preventDefault();
								}
							}
						}
						break;
					case 'show':
						if (!dialog_box.is(':visible')) {
							if (options.modal && options.hideGlobalScrollbar) {
								if (hasScroll(document.body)) {
									$('html')
										.addClass('xdsoft_overlay_lock_offset')
										.css('margin-right', getScrollbarWidth());
								}
								$('html').addClass('xdsoft_overlay_lock');
							}
							dialog_box.stop()[options.showFunction](function () {
								dialog_box.trigger('after' + _options + '.xdsoft');
								if (options['onAfter' + _options] && $.isFunction(options['onAfter' + _options])) {
									options['onAfter' + _options].call(that, options, _options);
								}
							});
							if (!options.modal) {
								dialog_box
									.data('old_width', dialog.width())
									.data('resize_interval', setInterval(function () {
										if (dialog.width() !== dialog_box.data('old_width')) {
											dialog_box.dialog('resize');
										}
									}, 300));
							}
						}
						break;
					case 'title':
						makeTitle(second, dialog_box.find('.xdsoft_dialog_popup_title'), dialog_box, options);
						break;
					case 'content':
						dialog_box
								.find('.xdsoft_dialog_content')
								.html(second);
						break;
					}
					if (_options.toLowerCase() !== 'hide' && _options.toLowerCase() !== 'show') {
						dialog_box.trigger('after' + _options + '.xdsoft');
						if (options['onAfter' + _options] && $.isFunction(options['onAfter' + _options])) {
							options['onAfter' + _options].call(that, options, _options);
						}
					}
				}
			} else {
				makeTitle(options.title, dialog_box.find('.xdsoft_dialog_popup_title'), dialog_box, options);
				makeButtons(options.buttons, tpl_button, dialog_box.find('.xdsoft_dialog_buttons'), dialog_box);
			}

			return dialog_box;
		}

		if ($.type(_options) === 'string') {
			return this;
		}

		dialog_box = $('<div class="xdsoft_dialog_overlay xdsoft_modal"></div>');

		dialog_box.css('zIndex', options.zIndex);

		dialog_box.data('options', options);

		dialog = $(tpl_dialog);

		dialog_box.on('mousedown.xdsoft', function (event) {
			if (options.closeOnClickOutside) {
				if (!hasScroll(this) || event.pageX < $(document.body).width() - getScrollbarWidth()) {
					dialog_box[plugin_name]('hide');
				}
			}
		});

		dialog.on('mousedown.xdsoft', function (event) {
			event.stopPropagation();
		});

		buttons_box = dialog.find('.xdsoft_dialog_buttons');

		dialog_box.append(dialog);

		dialog_box.dialog('content', that.length ? that[0] : '<div>' + that.selector + '</div>');

		dialog
			.find('.xdsoft_close')
				.click(function () {
				dialog_box[plugin_name]('hide');
			});

		makeTitle(options.title, dialog.find('.xdsoft_dialog_popup_title'), dialog_box, options);
		makeButtons(options.buttons, tpl_button, buttons_box, dialog_box);

		$('body').append(dialog_box);

		if (options.shown) {
			dialog_box.dialog('show');
		}
		if (!options.modal) {
			dialog_box.dialog('resize');
		}

		return dialog_box;
	};

	$.fn[plugin_name].default_options = default_options;

	$(window)
		.on('resize', function (event) {
			$('.xdsoft_dialog_overlay:visible')[plugin_name]('resize');
		})
		.on('keydown', function (event) {
			var dialogs;
			switch (event.which) {
			case 27:
			case 13:
				dialogs = $('.xdsoft_dialog_overlay:visible');
				break;
			}
			switch (event.which) {
			case 27:
				if (dialogs.length) {
					dialogs[plugin_name]('hide', 'esc', event);
				}
				break;
			case 13:
				if (dialogs.length) {
					dialogs[plugin_name]('ok', 'enter', event);
				}
				break;
			}
		});

	window.jAlert = function (msg, callback, title) {
		return $('<div>' + msg + '</div>')[plugin_name]({
			title: title,
			buttons: {
				'Ok': function () {
					if (callback && $.isFunction(callback)) {
						return callback.call(this);
					}
					this.dialog('hide');
				}
			}
		});
	};

	window.jConfirm = function (msg, callback, title) {
		return $('<div>' + msg + '</div>')[plugin_name]({
			title: title,
			buttons: {
				'Ok': callback || function () {},
				'Cancel': true
			}
		});
	};

	window.jPrompt = function (msg, default_value, callback, title) {
		if ($.isFunction(default_value)) {
			callback = default_value;
			default_value = false;
		}

		var tpl = '<div>' +
			'<div>' + msg + '</div>' +
			'<div>' +
			'<input autofocus class="xdsoft_prompt" type="text" value="' + (default_value ? default_value.replace(/[&<>"']/g, function (match) {return '&#' + match.charCodeAt(0) + ';'; }) : '') + '">' +
			'</div>' +
			'</div>';

		return $(tpl)[plugin_name]({
			title: title,
			onAfterShow: function () {
				this.find('.xdsoft_prompt').focus();
			},
			buttons: {
				'Ok': function (event) {
					var val = this.find('input.xdsoft_prompt').val();
					(callback || function () {}).call(this, event, val);
				},
				'Cancel': true
			}
		});
	};

	window.jWait = function (title, with_close, not_close_on_click) {
		return $('<div class="xdsoft_waiter"></div>')[plugin_name]({
			title: title,
			closeBtn: with_close ? true : false,
			closeOnClickOutside: not_close_on_click ? false : true
		});
	};
}(jQuery));

//www.sucaijiayuan.com