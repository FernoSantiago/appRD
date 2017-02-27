class LoginPage

  include PageObject

  page_url "https://www.rdstation.com.br/login"

  text_field( :email, :id => "user_email" )
  text_field( :senha, :id => "user_password" )
  button( :bt_entrar, :name => "commit" )

  def login(email, senha)
    self.email = email
    self.senha = senha
    bt_entrar
  end

end
