import { FormContainer } from './styles'
import userIcon from '../../../assets/UserIconTenant.png'
/* import verifiedIcon from '../../../assets/akar-icons_check.png' */
import cancelIcon from '../../../assets/cancel-icon.png'
import { Link } from 'react-router-dom'
import { FormEvent, useContext, useEffect, useState } from 'react'
import { AuthContext } from '../../../contexts/Auth/AuthContext'
import { BaseURL } from '../../../main'
import axios from 'axios'

export function AccountEditTenant() {
  const auth = useContext(AuthContext)

  const [dataLoaded, setDataLoaded] = useState(false)

  const [formData, setFormData] = useState({
    name: auth.user?.name,
    email: auth.user?.email || '',
    document: auth.user?.document || '',
    birthDate: auth.user?.birthDate || '',
  })

  useEffect(() => {
    const getFormData = async () => {
      try {
        const data = await axios.get(`${BaseURL}/users/me`, {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        })
        setFormData(data.data)
        setDataLoaded(true)
      } catch (e) {
        setDataLoaded(false)
      }
    }
    getFormData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  const handleSubmit = async (event: FormEvent) => {
    event.preventDefault()
    const formDataToSend = {
      ...formData,
    }

    try {
      const response = await axios.put(
        `${BaseURL}/users/update`,
        formDataToSend,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        },
      )
      if (response.status === 204) {
        window.location.reload()
      }
    } catch (e) {
      console.error(e, 'Erro na requisição')
    }
  }

  const handleRemove = async (event: FormEvent) => {
    event.preventDefault()
    try {
      const response = await axios.delete(`${BaseURL}/users`, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('authToken')}`,
          'ngrok-skip-browser-warning': 'true',
        },
      })
      console.log(response.status)
      if (response.status === 200) {
        localStorage.setItem('authToken', '')
        /* window.location.reload() */
        return response
      }
    } catch (e) {
      console.error('Falha na requisição:', e)
    }
  }

  return (
    <FormContainer>
      {dataLoaded ? (
        <div className="infoDiv">
          <div className="staticInfo">
            <img src={userIcon} alt="" />
            <div className="infos">
              <h2>{auth.user?.name}</h2>
              <p>{auth.user?.email}</p>
            </div>
            <div className="verified">
              {/* <div className="emailVerified">
                <img src={verifiedIcon} alt="" />
                <p>Email Verificado</p>
              </div> */}
              <p>Hóspede/Cliente</p>
            </div>
          </div>
          <div className="content">
            <div className="userInfos">
              <h2>Olá, {auth.user?.name}</h2>
              <p>Cadastrado em: {auth.user?.registrationDate.split('T')[0]}</p>
            </div>
            <form action="" onSubmit={handleSubmit}>
              <input
                type="text"
                placeholder="Seu Nome"
                required
                value={formData.name}
                onChange={(e) =>
                  setFormData((prevData) => ({
                    ...prevData,
                    name: e.target.value,
                  }))
                }
              />
              <input
                type="email"
                placeholder="Seu Email"
                required
                value={formData.email}
                onChange={(e) =>
                  setFormData((prevData) => ({
                    ...prevData,
                    email: e.target.value,
                  }))
                }
              />
              <input
                type="text"
                className="cpf"
                placeholder="Seu Documento"
                required
                value={formData.document}
                onChange={(e) =>
                  setFormData((prevData) => ({
                    ...prevData,
                    document: e.target.value,
                  }))
                }
              />
              <input
                type="date"
                name="birthDate"
                id="bday"
                required
                onChange={(e) =>
                  setFormData((prevData) => ({
                    ...prevData,
                    birthDate: e.target.value as unknown as Date,
                  }))
                }
                value={formData.birthDate.toLocaleString()}
              />
              <label htmlFor="bday">*Data de Aniversário</label>
              <div className="buttons">
                <Link to="/users/me">
                  <button className="cancel" type="button">
                    <img src={cancelIcon} alt="" />
                    Cancelar
                  </button>
                </Link>
                <button className="remove" onClick={(e) => handleRemove(e)}>
                  Remover Conta
                </button>
                <button className="save" type="submit">
                  Salvar
                </button>
              </div>
            </form>
          </div>
        </div>
      ) : (
        <h1>Carregando dados...</h1>
      )}
    </FormContainer>
  )
}
