import strutils
import gdnim, godotapi / [label, engine]

gdnim FpsCounter of Label:

  #first: # runs when instanced, ignored on reload

  #dependencies: # specify names of components referenced by this component
  var lastFPS: float32

  method ready() =
    self.setProcess(true)

  method process(delta: float64) =
    let fps = getFramesPerSecond()
    if int(fps * 10) != int(self.lastFPS * 10):
      self.lastFPS = fps
      self.text = "FPS: " & formatFloat(fps, ffDecimal, 1)
