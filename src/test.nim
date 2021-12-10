import strutils
import godot
import godotapi / [engine, input, global_constants]

gdobj Test of Node:

  method ready*() =
    print("test")

  method input*(event: InputEvent) =
    if isKeyPressed(KEY_T):
      print("something")

  # method process*(delta: float64) =
  #   let fps = getFramesPerSecond()
  #   if int(fps * 10) != int(self.lastFPS * 10):
  #     self.lastFPS = fps
  #     self.text = "FPS: " & formatFloat(fps, ffDecimal, 1)
