import { useState } from 'react'
import axios from 'axios'
import { BackGroundImage, LoginContainer } from './styles'
import { BaseURL } from '../../main'

export function LoginForm() {
  const [formData, setFormData] = useState({
    email: '',
    password: '',
  })

  const loginUser = async (e: React.FormEvent) => {
    e.preventDefault()

    try {
      const response = await axios.post(`${BaseURL}/login`, {
        email: formData.email,
        password: formData.password,
      })

      const { token } = response.data

      localStorage.setItem('token', token)
      if (response.data.role === 'host') window.location.href = '/addHotel'
      if (response.data.role === 'tenant') window.location.href = '/'
    } catch (error) {
      console.error('Erro no login:', error)
    }
  }

  const handleInputChange = (
    event: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>,
  ) => {
    const { name, value } = event.target
    setFormData({
      ...formData,
      [name]: value,
    })
  }
  return (
    <BackGroundImage>
      <LoginContainer>
        <div className="titleContainer">
          <h2>Faça já seu login</h2>
          <p>É bom ter você aqui novamente!</p>
        </div>
        <div className="loginInput">
          <form action="" className="form" onSubmit={loginUser}>
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
              <a href="/forgotPassword">Esqueci minha senha</a>
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
