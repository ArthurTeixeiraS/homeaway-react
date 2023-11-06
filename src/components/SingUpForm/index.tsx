import { BackGroundImage, SingupContainer } from './styles'
import React, { useState } from 'react'
import axios from 'axios'
const userRegisterUrl: string = 'http://localhost:8080/register'

export function SingUpForm() {
  const [formData, setFormData] = useState({
    ddd: '68',
    phone: '',
    password: '',
    role: 'TENANT',
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
      <SingupContainer>
        <div className="titleContainer">
          <h2>
            Começe a <span className="containerSpan">Alugar!</span>
          </h2>
          <p>Mas antes, faça sua própria autenticação</p>
        </div>
        <div className="loginInput">
          <div className="form-title-container">
            <h6 className="form-title">
              Cadastro como{' '}
              <span id="span-change" className="blue">
                Cliente
              </span>
            </h6>
            <a href="/userLogin/">
              <span className="login">Já possuo uma conta</span>
            </a>
          </div>
          <form action="" className="form" onSubmit={(e) => getFormData(e)}>
            <select name="ddd" id="ddd" onChange={handleInputChange}>
              <option value="68">AC (68)</option>
              <option value="82">AL (82)</option>
              <option value="96">AP (96)</option>
              <option value="92">AM (92)</option>
              <option value="71">BA (71)</option>
              <option value="85">CE (85)</option>
              <option value="61">DF (61)</option>
              <option value="27">ES (27)</option>
              <option value="62">GO (62)</option>
              <option value="98">MA (98)</option>
              <option value="65">MT (65)</option>
              <option value="67">MS (67)</option>
              <option value="31">MG (31)</option>
              <option value="91">PA (91)</option>
              <option value="83">PB (83)</option>
              <option value="41">PR (41)</option>
              <option value="81">PE (81)</option>
              <option value="86">PI (86)</option>
              <option value="21">RJ (21)</option>
              <option value="84">RN (84)</option>
              <option value="51">RS (51)</option>
              <option value="69">RO (69)</option>
              <option value="95">RR (95)</option>
              <option value="48">SC (48)</option>
              <option value="11">SP (11)</option>
              <option value="79">SE (79)</option>
              <option value="63">TO (63)</option>
            </select>
            <input
              type="text"
              name="phone"
              id="phone"
              autoComplete="tel"
              pattern="[0-9]{5}-[0-9]{4}"
              required
              placeholder="00000-0000"
              onChange={handleInputChange}
            />
            <div className="caption">
              <p>
                Ligaremos ou enviaremos uma mensagem para confirmar seu número.
                <br />
                Aplicam-se taxas padrão de mensagens e dados.
              </p>
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
            <div className="buttons">
              <button type="submit" className="continue">
                Continuar
              </button>
              <button type="button" className="switchButton">
                <a href="/singupPartner">Quero hospedar</a>
              </button>
            </div>
          </form>
        </div>
      </SingupContainer>
    </BackGroundImage>
  )
}
