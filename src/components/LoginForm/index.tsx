import { LoginContainer, BackGroundImage } from './styles'
import React, { useState } from 'react'
import axios from 'axios'
const userRegisterUrl: string = 'http://localhost:8080/login'

export function LoginForm() {
  const [formData, setFormData] = useState({
    phone: '',
    password: '',
  })
  const handleInputChange = (
    event: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>,
  ) => {
    const { name, value } = event.target
    setFormData({
      ...formData,
      [name]: value,
    })
  }
  const getFormData = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    const url = userRegisterUrl

    axios
      .post(url, formData)
      .then((response) => {
        console.log('Resposta da requisição POST:', response.data)
      })
      .catch((error) => {
        console.error('Erro ao enviar a requisição POST:', error)
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
          <form action="" className="form" onSubmit={(e) => getFormData(e)}>
            <label htmlFor="phone">Digite o numero de Telefone</label>
            <input
              type="text"
              name="phone"
              id="phone"
              autoComplete="tel"
              pattern="[0-9]{7}-[0-9]{4}"
              required
              placeholder="Telefone (0000000-0000)"
              onChange={handleInputChange}
            />
            <p>
              Certifique-se que o telefone é o correto e que está no formato
              00000000-0000
            </p>
            <label htmlFor="phone">Digite a sua senha:</label>
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
