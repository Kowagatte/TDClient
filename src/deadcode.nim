#Nim imports
import strutils
import std/strformat

#Godot imports
import godot
import internal/godotstrings
import godotapi/[node, engine, stream_peer_tcp, input, global_constants, packet_peer_stream, scene_tree]
import os

const SERVER_IP: string = "127.0.0.1"
const PORT: int = 8888

gdobj Client of Node:

  var client: StreamPeerTCP
  var clientStream: PacketPeerStream
  var isConnected = false

  method ready*() =
    self.getTree().setAutoAcceptQuit(true)
    self.client = gdnew[StreamPeerTCP]()
    #self.client.setNoDelay(true)
    self.setProcess(true)
    print(fmt"Connecting to {SERVER_IP}:{PORT}")
    discard self.client.connectToHost(SERVER_IP, PORT)

  var seconds: float64 = 0

  method process*(delta: float64) =
    var status = self.client.getStatus()
    if status == STATUS_CONNECTED:
      if self.isConnected:
        self.poll()
      else:
        self.isConnected = true
        print("Connected to server")
        self.clientStream = gdnew[PacketPeerStream]()
        self.clientStream.streamPeer = self.client
    if status == STATUS_ERROR:
      print("Attempt to connect failed.")
      self.getTree().quit()
    if status == STATUS_CONNECTING:
      self.seconds += delta
      if(self.seconds >= 2):
        print("Connection failed, attempting to reconnect.")
        self.seconds = 0
    if status == STATUS_NONE:
      print("Disconnected from server.")
      self.disconnect()

  method input*(event: InputEvent) =
    if isKeyPressed(KEY_T):
      #print("something")
      self.sendMsg("something")

  method disconnect(): void =
    self.client.disconnectFromHost()
    self.getTree().quit()

  method sendMsg(msg: string) =
    if self.client.getStatus() == STATUS_CONNECTED:
      self.clientStream.stream_peer.putData(msg)
    var error = self.clientStream.getPacketError()
    if error != Error.OK:
      print("Error occurred on out stream.")

  method poll(): void =
    discard #pass
