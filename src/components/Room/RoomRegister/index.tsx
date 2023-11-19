import { ChangeEvent, FormEvent, useState } from 'react'
import { BackGroundImage, Container } from './styles'
import CurrencyInput from './PriceComponent'
import { Link } from 'react-router-dom'

interface FormData {
  name: string
  description: string
  dailyPrice: number
  maxPeople: number
  idHotel: string
}

export function RoomRegisterForm() {
  const [formData, setFormData] = useState<FormData>({
    name: '',
    description: '',
    dailyPrice: 0,
    maxPeople: 1,
    idHotel: window.location.href.split('/')[7],
  })

  const handleInputChange = (
    event: ChangeEvent<
      HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement
    >,
  ) => {
    const { name, value } = event.target
    setFormData((prevData) => ({ ...prevData, [name]: value }))
  }

  const handleSubmit = async (event: FormEvent) => {
    event.preventDefault()
    const formDataToSend = new FormData()

    formDataToSend.append('name', formData.name)
    formDataToSend.append('description', formData.description)
  }

  const [currencyValue, setCurrencyValue] = useState<number>(0)

  const handleCurrencyChange = (value: number) => {
    setCurrencyValue(value)
    formData.dailyPrice = value
  }

  return (
    <BackGroundImage>
      <Container>
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
              value={currencyValue}
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
            <Link to={`/users/myHotels/`}>
              <button type="button">Cancelar</button>
            </Link>
            <button type="submit">Enviar</button>
          </div>
        </form>
      </Container>
    </BackGroundImage>
  )
}
