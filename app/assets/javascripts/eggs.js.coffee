class Painttools
  color_shade: "#FF0000"
  constructor: ->
    @addAC()
    @addCP()

  addAC: -> $('#search').autocomplete(
    source: "/icons/list"
    select: (event,ui) ->
      filename = ui.item.filename
      Caman("/assets/#{filename}", "icon", -> 
        this.brightness(50).colorize(pt.color_shade, 60).render(->
          pt.renderPng())
      )
  )
  
  addCP: -> $('#palette').colorPicker(
    color: ['#AE3B00', '#6F7F62', '#284E59', '#601007', '#215273', '#452B14', '#936438', '#364F31', '#383129', '#42706E']
    click: (color) =>
      @color_shade = color
      Caman("/assets/egg.png", "egg", -> this.exposure(20).colorize(pt.color_shade, 10).saturation(60).render(->
        Caman("icon", -> this.brightness(60).colorize(pt.color_shade, 80).saturation(60).render(->
          pt.renderPng())))
      )
  )
  
  renderPng: ->
    cnvs = document.createElement('canvas');
    cnvs.height="140";
    cnvs.width="110";
    
    cntxt = cnvs.getContext "2d"
    cntxt.drawImage $("#egg")[0], 0, 0
    cntxt.drawImage $("#icon")[0], 30, 49, 50, 50
    
    
    img_data = cnvs.toDataURL "image/png"
    img = '<img src="'+img_data+'"/>'
    
    $('.image img').remove()
    $('.image').append img
    
$ -> window.pt = new Painttools