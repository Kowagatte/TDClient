import std/net
import std/locks
import std/json
import packets_pb

const connectionSettings = staticread("./connection_info.json")
let settingsAsJson = parseJson(connectionSettings)

let SERVER_IP = settingsAsJson["ip"].getStr
let PORT = Port(settingsAsJson["port"].getInt)

var
  connectThread: Thread[void]
  serverSocket: Socket = newSocket()
  socketLock: Lock

proc startServerThreadFunc() {.thread.} =
  {.cast(gcsafe).}:
    acquire(socketLock)
    try:
      serverSocket.connect(SERVER_IP, PORT, 5000)
    except:
      discard #
    release(socketLock)

initLock(socketLock)
#createThread(connectThread, startServerThreadFunc)

proc isConnected*(): bool =
  {.cast(gcsafe).}:
    if tryAcquire(socketLock):
      result = serverSocket.trySend("")
      release(socketLock)
    else:
      result = false

proc connectServer*() =
  createThread(connectThread, startServerThreadFunc)

proc sendMsg*(msg: string) =
  serverSocket.send(msg)

proc sendLogin(email: string, password: string) =
  var loginPacket = newClientPacket_DummyPacket()
  loginPacket.email = email
  loginPacket.password = password
  serverSocket.send(serialize(loginPacket))

proc receiveData() =
  discard #TODO
