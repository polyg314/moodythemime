#client only code
window.App ?= {}
window.Famous ?={}

Meteor.startup ->  
  Famous.Engine = famous.core.Engine
  Famous.View = famous.core.View
  Famous.Surface = famous.core.Surface
  Famous.Modifier = famous.core.Modifier
  Famous.Transform = famous.core.Transform
  Famous.Draggable = famous.modifiers.Draggable
  Famous.StateModifier = famous.modifiers.StateModifier
  Famous.ModifierChain = famous.modifiers.ModifierChain
  Famous.RenderController = famous.views.RenderController
  Famous.EventHandler = famous.core.EventHandler

  Famous.Scrollview = famous.views.Scrollview
  Famous.HeaderFooterLayout = famous.views.HeaderFooterLayout

  Famous.Easing = famous.transitions.Easing
  Famous.Transitionable = famous.transitions.Transitionable

  Famous.GenericSync     = famous.inputs.GenericSync
  Famous.MouseSync = famous.inputs.MouseSync
  Famous.TouchSync = famous.inputs.TouchSync


  Famous.Timer           = famous.utilities.Timer

  #Famous.FastClick       = famous.inputs.FastClick
  Famous.Transitionable.registerMethod 'spring',famous.transitions.SpringTransition

  Famous.GenericSync.register
    mouse: Famous.MouseSync
    touch: Famous.TouchSync
  App.events = new Famous.EventHandler

Router.route '/', ->
  this.render 'transition'

    


Template.transition.rendered = ->
  c = FView.byId 'mainCtx'
  c.context.setPerspective 1000
  angleDegrees = new Famous.Transitionable -90
  
  isToggled = off
  defaultd = angleDegrees.get()
  degtorad = 0.0174533
  flag = off
 
  bb = FView.byId 'button'
  bbs = bb.surface
  rb = FView.byId 'card'
  rbs = rb.surface
  rbm = rb.modifier
  bbs.on 'click',=>
    if isToggled is on
      targetAngle = 0
    else
      targetAngle = -90
    if angleDegrees.isActive()
      angleDegrees.halt()
    angleDegrees.set targetAngle, { duration: 1000 },=>
    isToggled = !isToggled

#TRANSFORM ROTATE UNITS ARE SPECIFIED IN RADIANS - SO WE MUST CONVERT FROM DEGREES
  rbm.transformFrom =>
    return Famous.Transform.rotateX angleDegrees.get()*degtorad  
  

  