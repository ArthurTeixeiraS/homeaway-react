import { BackGroundImage, SingupContainer } from './styles'
import React, { useState } from 'react'
import axios from 'axios'
const userRegisterUrl: string = 'http://localhost:8080/register'

export function SingUpFormPartner() {
  const [formData, setFormData] = useState({
    email: '',
    password: '',
    repeatPassword: '',
    role: 'HOST',
  })
  const [passwordError, setPasswordError] = useState('')

  const handleInputChange = (
    event: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>,
  ) => {
    const { name, value } = event.target
    setFormData({
      ...formData,
      [name]: value,
    })
    if (name === 'password' || name === 'repeatPassword') {
      setPasswordError('')
    }
  }
  const getFormData = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    if (formData.password !== formData.repeatPassword) {
      setPasswordError('As senhas não coincidem.')
      return
    }
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
      <SingupContainer>
        <div className="titleContainer">
          <h2>
            Começe a <span className="containerSpan">Hospedar!</span>
          </h2>
          <p>Mas antes, faça sua própria autenticação</p>
        </div>
        <div className="loginInput">
          <div className="form-title-container">
            <h6 className="form-title">
              Cadastro como <span id="span-change">Parceiro</span>
            </h6>
            <a href="/login/">
              <span className="login">Já possuo uma conta</span>
            </a>
          </div>
          <form action="" className="form" onSubmit={(e) => getFormData(e)}>
            <input
              type="email"
              name="email"
              id="email"
              required
              placeholder="exemplo@email.com"
              onChange={handleInputChange}
            />
            <div className="caption">
              <p>Enviaremos um email para confirmar que é realmente você</p>
            </div>
            <input
              type="password"
              name="password"
              className="password"
              placeholder="Insira sua senha"
              required
              onChange={handleInputChange}
              minLength={8}
            />
            <div className="caption">
              <p>
                Insira pelo menos 8 caracteres, recomendamos uso de letras,
                números, letras maiúsculas e símbolos
              </p>
            </div>
            <input
              type="password"
              name="repeatPassword"
              className="password"
              placeholder="Repita sua senha"
              required
              onChange={handleInputChange}
              minLength={8}
            />
            <div className="caption error">
              <p>{passwordError}</p>
            </div>
            <div className="buttons">
              <button type="submit" className="continue">
                Continuar
              </button>
              <button type="button" className="switchButton">
                <a href="/singup">Quero alugar</a>
              </button>
            </div>
          </form>
        </div>
      </SingupContainer>
    </BackGroundImage>
  )
}
