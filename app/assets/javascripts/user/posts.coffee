$(window).on 'scroll', ->
  scrollHeight = $(document).height()
  scrollPosition = $(window).height() + $(window).scrollTop()
  if (scrollHeight - scrollPosition) / scrollHeight <= 0.05
    $('.jscroll').jscroll
      contentSelector: '.post-content'
      nextSelector: 'span.next:last a'
    return
  return