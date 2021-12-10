#Nim imports
import strutils
import std/strformat

#Godot imports
import godot
import godotapi / [engine, input, global_constants]

gdobj Client of Node:

  var client: StreamPeerTCP
  var clientStream: PacketPeerStream
  var isConnected = false
  var shouldConnect = false

  const SERVER_IP: string = "127.0.0.1"
  const PORT: int = 8888

  method ready*() =
    client = StreamPeerTCP.new()
    client.set_no_delay(true)
    connect(10)

  method process*(delta: float64) =
    if shouldConnect and not isConnected:
      discard #pass
    if isConnected and not client.is_connected_to_host():
      connected = false
    if client.is_connected_to_host():
      poll()

  method input*(event: InputEvent) =
    if isKeyPressed(KEY_T):
      print("something")

  proc connect(timeout: int): void =
    set_process(true)
    shouldConnect = true
    print(fmt"Connecting to {SERVER_IP}:{PORT}")
    var connected = client.connect_to_host(SERVER_IP, PORT)
    if connected == OK:
      if client.is_connected_to_host():
        isConnected = true
        print("Connected to server")
        clientStream = PacketPeerStream.new()
        clientStream.set_stream_peer(client)
    else:
      print("Attempt to connect failed.")

  proc disconnect(): void =
    client.disconnect_from_host()

  proc poll(): void =
    discard #pass


  # method process*(delta: float64) =
  #   let fps = getFramesPerSecond()
  #   if int(fps * 10) != int(self.lastFPS * 10):
  #     self.lastFPS = fps
  #     self.text = "FPS: " & formatFloat(fps, ffDecimal, 1)
