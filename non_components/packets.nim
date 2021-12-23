import packets_pb
import nimpb/nimpb
import nimpb/wkt/any
import std/strutils
import gdnim

ServerPacket_PingPacket.registerType
ServerPacket_ResponsePacket.registerType

#TODO
template isA*[C](a: Message, b: typedesc[C], body: untyped): untyped =
  if a of b:
    let it {.inject.} = C(a)
    body

proc construct*[A: Message](packet: A): string =
  ##Packs and serializes a Packet Message to a byteArray/String
  serialize(any.pack(packet))

proc toAny*(packet: string): google_protobuf_Any =
  newgoogle_protobuf_Any(packet)

proc destruct*(packet: string): google_protobuf_Any =
  newgoogle_protobuf_Any(packet)

export packets_pb
export nimpb
export any
