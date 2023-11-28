import { ChangeEvent, FormEvent, useEffect, useState } from 'react'
import { BackGroundImage, Container } from './styles'
import CurrencyInput from './PriceComponent'
import { Link, useNavigate } from 'react-router-dom'
import axios from 'axios'
import { BaseURL } from '../../../main'

interface FormData {
  name: string
  description: string
  dailyPrice: number
  maxPeople: number
  hotel: {
    id: string
  }
}

export function RoomEditForm() {
  const idRoom = window.location.href.split('/')[7]
  const [formData, setFormData] = useState<FormData>({
    name: '',
    description: '',
    dailyPrice: 0,
    maxPeople: 1,
    hotel: {
      id: '',
    },
  })

  const [dataLoaded, setDataLoaded] = useState(false)

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(`${BaseURL}/rooms/${idRoom}`, {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
          },
        })
        const roomData = response.data
        setFormData(roomData)
        setDataLoaded(true)
      } catch (error) {
        console.error('Erro ao obter dados do quarto:', error)
      }
    }
    fetchData()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  const handleInputChange = (
    event: ChangeEvent<
      HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement
    >,
  ) => {
    const { name, value } = event.target
    setFormData((prevData) => ({ ...prevData, [name]: value }))
  }

  const navigate = useNavigate()
  const handleSubmit = async (event: FormEvent) => {
    event.preventDefault()

    try {
      console.log(formData)
      const response = await axios.put(
        `${BaseURL}/rooms/${idRoom}`,
        {
          ...formData,
          dailyPrice: parseFloat(currencyValue.toFixed(2)),
        },
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('authToken')}`,
            'ngrok-skip-browser-warning': 'true',
            'Content-Type': 'application/json',
          },
        },
      )
      if (response.status === 200) {
        navigate(`/users/myHotels/room/edit/${response.data.id}/image`)
      }
    } catch (error) {
      console.error('Erro na requisição:', error)
    }
  }

  const [currencyValue, setCurrencyValue] = useState<number>(0)

  const handleCurrencyChange = (value: number) => {
    setCurrencyValue(value)
    formData.dailyPrice = parseFloat(currencyValue.toFixed(2))
  }

  return (
    <BackGroundImage>
      <Container>
        {dataLoaded ? (
          <form action="" onSubmit={handleSubmit}>
            <h1>Cadastro de Quartos</h1>
            <div className="inputs">
              <label htmlFor="name">Nome do Quarto</label>
              <input
                type="text"
                name="name"
                value={formData.name}
                onChange={handleInputChange}
                required
                placeholder="Quarto N°100"
              />
              <label htmlFor="description">Descrição</label>
              <textarea
                cols={8}
                rows={8}
                name="description"
                value={formData.description}
                onChange={handleInputChange}
                required
                minLength={20}
              ></textarea>
              <label htmlFor="dailyPrice">Preço da Diária</label>
              <CurrencyInput
                value={formData.dailyPrice * 100}
                onChange={handleCurrencyChange}
              />
              <label htmlFor="">Visitantes:</label>
              <div className="maxpeople">
                <input
                  type="number"
                  name="maxPeople"
                  id=""
                  value={formData.maxPeople}
                  onChange={handleInputChange}
                />
                <p>Pessoas</p>
              </div>
            </div>
            <div className="submit">
              <Link to={`/users/myHotels/${formData.hotel.id}`}>
                <button type="button">Cancelar</button>
              </Link>
              <button type="submit">Enviar</button>
            </div>
          </form>
        ) : (
          <h1>Carregando dados...</h1>
        )}
      </Container>
    </BackGroundImage>
  )
}
