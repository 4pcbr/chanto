Router = (() ->
  self = this
  this.routing_table = {}
  {
    register: ( name, mask, handler ) ->
      self.routing_table[name] = { mask: mask, handler: handler }
      Router
    proceed: () ->
      href = Request.pathname()

      $.each( self.routing_table, ( name, obj ) ->
        mask = obj.mask
        handler = obj.handler
        proceed = false

        try
          if typeof( mask ) == "string"
            if href.search( mask ) != -1
              proceed = true
          else if mask instanceof Array
            if mask.indexof( href ) != null
              proceed = true
          else if typeof( mask.test ) == "function"
            if mask.test( href )
              proceed = true
          else if typeof( mask ) == "function"
            if mask.call( window )
              proceed = true
          if proceed
            handler.call( self )
            try
              self.action.bang() if self.action
            catch e
              Logger.debug e
            false
        catch e
          Logger.debug e
      )
  }
)()

window.Router = Router