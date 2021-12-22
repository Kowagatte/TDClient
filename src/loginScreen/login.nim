import ../connection
import godot
import godotinternal
import godotapi/[engine, node, line_edit, button, input, global_constants, link_button, scene_tree]
import ../utils/packets

gdobj Login of Node:

  var
    emailEnter: LineEdit
    passwordEnter: LineEdit
    loginButton: Button
    createAccountButton: LinkButton

  method ready*() =
    self.emailEnter = self.getNode(newNodePath("Email/EmailEnter")) as LineEdit
    self.passwordEnter = self.getNode(newNodePath("Password/PasswordEnter")) as LineEdit
    self.loginButton = self.getNode(newNodePath("LoginButton")) as Button
    self.createAccountButton = self.getNode(newNodePath("CreateAccount/CreateAccountButton")) as LinkButton
    discard self.loginButton.connect("pressed", self, "_send_credentials")
    discard self.createAccountButton.connect("pressed", self, "_create_account")

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

  method createAccount*() =
    discard self.getTree().changeSceneImpl("res://scenes/CreateAccountScreen.tscn")
