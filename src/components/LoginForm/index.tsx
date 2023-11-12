import { LoginContainer, BackGroundImage } from './styles'
import React, { useState } from 'react'
import axios from 'axios'
const userRegisterUrl: string = 'http://localhost:8080/login'

export function LoginForm() {
  const [formData, setFormData] = useState({
    email: '',
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
    console.log(formData)

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
