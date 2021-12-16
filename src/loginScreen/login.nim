import ../connection
import godot
import godotinternal
import godotapi/[engine, node, line_edit, button, input, global_constants]
import ../utils/packets

gdobj Login of Node:

  var
    emailEnter: LineEdit
    passwordEnter: LineEdit
    loginButton: Button

  method ready*() =
    self.emailEnter = self.getNode(newNodePath("Email/EmailEnter")) as LineEdit
    self.passwordEnter = self.getNode(newNodePath("Password/PasswordEnter")) as LineEdit
    self.loginButton = self.getNode(newNodePath("LoginButton")) as Button
    discard self.loginButton.connect("pressed", self, "_send_credentials")

  method sendCredentials() =
    var loginPacket: ClientPacket_LoginPacket = newClientPacket_LoginPacket()
    loginPacket.email = self.emailEnter.text
    loginPacket.password = self.passwordEnter.text
    sendData(construct(loginPacket))

  method input*(event: InputEvent) =
    if isKeyPressed(KEY_T):
      let pack = receiveMessage()
      if pack of ServerPacket_ResponsePacket:
        let resp = ServerPacket_ResponsePacket pack
        echo resp.code
        echo resp.message
      #echo serialize(receiveMessage())
      #print(serialize(receiveMessage()))

  method debugLoginCredentials*() =
    print("Email:", self.emailEnter.text)
    print("Password:", self.passwordEnter.text)
