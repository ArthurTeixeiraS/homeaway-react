import { FormEvent, useState } from 'react'
import { BackGroundImage, Container } from './styles'
import axios from 'axios'
import { useNavigate } from 'react-router-dom'
import { BaseURL } from '../../main'

export function ForgotPasswordForm() {
  const [email, setEmail] = useState({
    email: '',
  })
  const [sendEmail, setSendEmail] = useState(false)
  const [formData, setFormData] = useState({
    code: '',
    newPassword: '',
    repeatPassword: '',
  })

  const navigate = useNavigate()

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target
    setFormData({
      ...formData,
      [name]: value,
    })
  }

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    console.log(email)
    const response = await axios.post(`${BaseURL}/passwords/send-reset-email`, {
      email: email.email,
    })
    if (response.status === 204) {
      setSendEmail(true)
    } else {
      setSendEmail(false)
    }
  }

  const handleEmailChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event?.target
    setEmail({
      ...email,
      [name]: value,
    })
  }

  const changePasswordSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault()
    console.log(formData)
    const response = await axios.post(
      `${BaseURL}/passwords/forgot-password-reset`,
      formData,
      { headers: { 'Content-Type': 'application/json' } },
    )
    if (response.status === 204) {
      alert('Senha alterada com sucesso')
      navigate('/singin')
    }
  }

  return (
    <BackGroundImage>
      <Container>
        <div className="titleContainer">
          <h2>Recupere sua Senha</h2>
          <p>Esqueceu sua senha? Recupere-a agora!</p>
        </div>
        {!sendEmail && (
          <div className="emailInput">
            <form action="" onSubmit={handleSubmit}>
              <label htmlFor="email">Email</label>
              <input
                type="email"
                name="email"
                id="email"
                required
                placeholder="exemplo@email.com"
                value={email.email}
                onChange={handleEmailChange}
              />
              <div className="caption">
                Forneça o email da conta que você deseja recuperar a senha e
                verifique seu Inbox após enviar
              </div>
              <div className="buttons">
                <button type="submit">Enviar</button>
              </div>
            </form>
          </div>
        )}
        {sendEmail && (
          <div className="emailInput">
            <form action="" onSubmit={(e) => changePasswordSubmit(e)}>
              <label htmlFor="code">Código</label>
              <input
                type="text"
                name="code"
                id="code"
                required
                placeholder=""
                value={formData.code}
                onChange={handleInputChange}
              />
              <div className="caption">
                Insira o código que enviamos no seu email
              </div>
              <label htmlFor="newPassword">Nova Senha</label>
              <input
                type="password"
                name="newPassword"
                id="newPassword"
                required
                placeholder=""
                value={formData.newPassword}
                onChange={handleInputChange}
              />
              <div className="caption">Insira sua nova senha</div>
              <label htmlFor="repeatPassword">Repita sua nova Senha</label>
              <input
                type="password"
                name="repeatPassword"
                id="repeatPassword"
                required
                placeholder=""
                value={formData.repeatPassword}
                onChange={handleInputChange}
              />
              <div className="caption">Repita sua nova senha</div>
              <div className="buttons">
                <button type="submit">Enviar</button>
              </div>
            </form>
          </div>
        )}
      </Container>
    </BackGroundImage>
  )
}
