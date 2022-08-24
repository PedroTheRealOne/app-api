class Token
  PASSWORD = ENV["SECRET_KEY_BASE"]
  ALGORITHM = ENV["TOKEN_ALGORITHM"]

  def encode(user)
    token = JWT.encode({ id: user.id, email: user.email }, PASSWORD, ALGORITHM)
  end

  def decode(token)
    token_payload = JWT.decode(token, PASSWORD, true, algorithm: ALGORITHM).first.with_indifferent_access rescue nil
    token_payload && User.find_by(id: token_payload[:id])
  end
end
