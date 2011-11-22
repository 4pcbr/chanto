Renderer = ( options ) ->
  this._init( options )
  null

Renderer.prototype = {
  _init: ( options ) ->
    options = options || {}
    this.options = $.extend( {}, options )
  render: ( data ) ->
    Logger.debug "renderer called"
  setHeader: ( content ) ->
    $("div[data-role=\"header\"]").empty().append( content )
  getHeader: () ->
    $("div[data-role=\"header\"]").last()
  setFooter: ( content ) ->
    $("div[data-role=\"footer\"]").empty().append( content )
  getFooter: () ->
    $("div[data-role=\"footer\"]").last()
  setContent: ( content ) ->
    $("div[data-role=\"content\"]").empty().append( content )
  getContent: () ->
    $("div[data-role=\"content\"]").last()
}

window.Renderer = Renderer
