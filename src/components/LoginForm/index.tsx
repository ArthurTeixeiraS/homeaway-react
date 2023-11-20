import { useContext, useState } from 'react'
import { BackGroundImage, LoginContainer } from './styles'
import { Link, useNavigate } from 'react-router-dom'
import { AuthContext } from '../../contexts/Auth/AuthContext'

export function LoginForm() {
  const auth = useContext(AuthContext)
  const navigate = useNavigate()

  const [formData, setFormData] = useState({
    email: '',
    password: '',
  })

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = event.target
    setFormData({
      ...formData,
      [name]: value,
    })
  }

  const handleLogin = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    if (formData.email && formData.password) {
      const isLogged = await auth.singin(formData.email, formData.password)
      if (isLogged) {
        alert('Login efetuado com sucesso!')
        navigate('/users/me')
      } else {
        alert('Falha ao logar, tente novamente.')
      }
    }
  }
  return (
    <BackGroundImage>
      <LoginContainer>
        <div className="titleContainer">
          <h2>Faça já seu login</h2>
          <p>É bom ter você aqui novamente!</p>
        </div>
        <div className="loginInput">
          <form action="" className="form" onSubmit={(e) => handleLogin(e)}>
            <label htmlFor="email">Digite seu email</label>
            <input
              type="email"
              name="email"
              id="email"
              required
              placeholder="exemplo@email.com"
              onChange={handleInputChange}
            />
            <p></p>
            <label htmlFor="password" className="labelPassword">
              Digite a sua senha:
            </label>
            <input
              type="password"
              name="password"
              className="password"
              placeholder="Insira sua senha"
              required
              minLength={8}
              onChange={handleInputChange}
            />
            <p>
              <Link to="/forgotPassword">Esqueci minha senha</Link>
            </p>
            <div className="buttons">
              <button type="submit" className="continue">
                Continuar
              </button>
            </div>
          </form>
        </div>
      </LoginContainer>
    </BackGroundImage>
  )
}
