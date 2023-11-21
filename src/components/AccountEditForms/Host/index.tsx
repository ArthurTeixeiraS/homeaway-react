import { FormContainer } from './styles'
import userIcon from '../../../assets/UserIconHost.png'
import verifiedIcon from '../../../assets/akar-icons_check.png'
import cancelIcon from '../../../assets/cancel-icon.png'
import { Link } from 'react-router-dom'
import { FormEvent, useContext, useEffect, useState } from 'react'
import { AuthContext } from '../../../contexts/Auth/AuthContext'
import axios from 'axios'
import { BaseURL } from '../../../main'

export function AccountEditHost() {
  const auth = useContext(AuthContext)
  const [dataLoaded, setDataLoaded] = useState(false)

  const registerDate = auth.user?.registrationDate

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

  const [formData, setFormData] = useState({
    name: auth.user?.name,
    email: auth.user?.email || '',
    document: auth.user?.document || '',
    birthDate: auth.user?.birthDate || '',
  })

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
        console.log('Registro alterado com sucesso: ', response.data)
        window.location.reload()
      }
    } catch (e) {
      console.error(e, 'Erro na requisição')
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
              <div className="emailVerified">
                <img src={verifiedIcon} alt="" />
                <p>Email Verificado</p>
              </div>
              <p>Hospedeiro/Parceiro</p>
            </div>
          </div>
          <div className="content">
            <div className="userInfos">
              <h2>Olá, {auth.user?.name}</h2>
              <p>Cadastrado em: {registerDate?.split('T')[0]}</p>
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
                <button className="remove">Remover Conta</button>
                <button className="save">Salvar</button>
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
