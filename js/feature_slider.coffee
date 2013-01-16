class FeatureSlider
  idx: 0

  constructor: (opts = {}) ->
    return if $('#feature_slider').size() <= 0

    @$feature_slider = $('#feature_slider')
    @$features = @$feature_slider.find('li')
    @$main_feature = @$feature_slider.find('#main_feature')

    @count = @$features.size()
    @interval = opts.interval || 5000

    @startTimer()

  cycleImages: () =>
    if @idx == @count - 1 then @idx = 0 else @idx++

    @$features.removeClass('current')

    $current_feature = $(@$features[@idx])
    $current_feature.addClass('current')

    caption = $current_feature.find('figcaption').html()
    image = $current_feature.find('img').data('large')

    @$main_feature.find('img').attr('src', image)
    @$main_feature.find('figcaption').html(caption)

  startTimer: () ->
    setInterval(@cycleImages, @interval)

$ ->
  new FeatureSlider(interval: 3500)
