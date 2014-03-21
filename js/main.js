;(function ($, window, document, undefined) {
  'use strict';

  $(function () {

    // Programmatically hide buttons that are supposed to be hidden. This
    // ensures that the initial display state is correctly stored and applied
    // if the button is later shown.
    $('.Button.Hidden').removeClass('Hidden').hide();

    // Attach spinners to the .InProgress element in flyouts using Spin.js
    $(document).on('click', '.ToggleFlyout', function (e) {
      $('.InProgress', e.currentTarget).spin(spinner);
    });

    var spinner = {
      lines  : 11
    , radius : 5
    , length : 5
    , width  : 2
    };

    var backdrop = '.Overlay'
      , dialog   = '.Overlay > .Popup';

    $(document)
      // Show the modal backdrop, but hide the actual modal dialog while it's
      // loading.
      .on('popupLoading', function (e) {
        $('body').addClass('modal-open');
        $(dialog).addClass('fade');
        $(backdrop).spin(spinner);
      })
      // Fade in the modal dialog when it's time to reveal it.
      .on('popupReveal', function (e) {
        $(dialog).addClass('in');
        $(backdrop).spin(false);
      })
      // When it's time to close the modal, first fade out the modal dialog,
      // then fade out the modal backdrop, and lastly remove the entire modal
      // from the DOM.
      .on('popupClose', function (e) {
        $(dialog).removeClass('in');
        setTimeout(function () { $('body').removeClass('modal-open'); }, 150);
        setTimeout(function () { $(backdrop).remove(); }, 300);
      });

    // When only a confirmation modal is shown, the "popupLoading" and
    // "popupReveal" events are never triggered. Manually trigger them to make
    // sure that the modal is actually shown.
    $(document).on('click', 'a.Delete, a.DeleteComment, a.PopConfirm', function (e) {
      $('body').trigger('popupLoading');
      setTimeout(function () { $('body').trigger('popupReveal'); }, 150);
    });

  });

  /**
   * Override the popup.close method to ensure that the modal isn't immdiately
   * removed from the DOM upon closing the dialog. This version of the method
   * instead lets it be up to listeners to actually close the modal, just like
   * it's the reponsibility of listeners to show the modal.
   *
   * @param  {Object} settings
   * @param  {Object} response
   * @return {bool}
   */
  $.popup.close = function (settings, response) {
    $(document).unbind('keydown.popup');
    $('#' + settings.popupId).trigger('popupClose');

    return false;
  };

})(jQuery, window, document);
