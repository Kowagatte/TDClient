import ../connection
import godot
import godotinternal
import godotapi/[engine, node, line_edit, button, label, scene_tree, link_button]
import ../utils/packets

gdobj CreateAccount of Node:

  var
    emailEnter: LineEdit
    usernameEnter: LineEdit
    passwordEnter: LineEdit
    confirmPasswordEnter: LineEdit
    errorMessage: Label
    createButton: Button
    gotoLogin: LinkButton

  method ready*() =
    self.emailEnter = self.getNode(newNodePath("Email/EmailEnter")) as LineEdit
    self.usernameEnter = self.getNode(newNodePath("Username/UsernameEnter")) as LineEdit
    self.passwordEnter = self.getNode(newNodePath("Password/PasswordEnter")) as LineEdit
    self.confirmPasswordEnter = self.getNode(newNodePath("ConfirmPassword/CPasswordEnter")) as LineEdit
    self.createButton = self.getNode(newNodePath("CreateButton")) as Button
    self.gotoLogin = self.getNode(newNodePath("Login/LoginButton")) as LinkButton
    self.errorMessage = self.getNode(newNodePath("ErrorMessage")) as Label
    #discard self.createButton.connect("pressed", self, "_debug_login_credentials")
    discard self.createButton.connect("pressed", self, "_send_creation")
    discard self.gotoLogin.connect("pressed", self, "_change_to_login_screen")

  method sendCreation() =
    if self.passwordEnter.text != self.confirmPasswordEnter.text:
      self.errorMessage.text = "Passwords do not match."
    else:
      var createAccountPacket: ClientPacket_CreateAccountPacket = newClientPacket_CreateAccountPacket()
      createAccountPacket.email = self.emailEnter.text
      createAccountPacket.username = self.usernameEnter.text
      createAccountPacket.password = self.passwordEnter.text
      #print(serialize(pack(createAccountPacket)))
      #print(serialize(createAccountPacket))
      sendData(construct(createAccountPacket))

  method changeToLoginScreen() =
    discard self.getTree().changeSceneImpl("res://scenes/LoginScreen.tscn")

  method debugLoginCredentials*() =
    print("Email: ", self.emailEnter.text)
    print("Username: ", self.usernameEnter.text)
    print("Password: ", self.passwordEnter.text)
    print("Confirmed Password: ", self.confirmPasswordEnter.text)
