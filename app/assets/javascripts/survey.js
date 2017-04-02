$(document).ready(function() {
  $('input[type=radio].fantasy').change(function() {
    var container = $(this).closest('div').find('.mdl-slider__container');
    var slider = $(container).find('input[type=range]')[0];
    if (this.value == 0) {
      $(container).removeClass('show');
      $(slider).attr('min', 0)
      $(slider).attr('value', 0)
    }
    else {
      $(container).addClass('show');;
      $(slider).attr('value', this.value)
      $(slider).attr('min', this.value)
      $(slider).attr('max', parseInt(this.value) + 4)
    }
  });

  $('select').change(function() {
    var container = $(this).closest('div').find('.mdl-slider__container');
    var slider = $(container).find('input[type=range]')[0];
    if (this.value == 0) {
      $(container).removeClass('show');
      $(slider).attr('min', 0)
      $(slider).attr('value', 0)
    }
    else {
      $(container).addClass('show');
      var min = parseInt(this.value) >= 1 ? (parseInt(this.value) * 5) - 4 : parseInt(this.value);
      $(slider).attr('value', min)
      $(slider).attr('min', min)
      $(slider).attr('max', min + 4)
    }
  });
});
