import { useState } from 'react'
import { AddRoom } from './styles'
import ImageInput from './ImagePreview'
import CurrencyInput from './PriceComponent'

interface FormData {
  name: string
  description: string
  image: File | null
  dailyPrice: number
  maxPeople: number
  street: string
  number: number
  neighbourhood: string
  city: string
}

export function AddRoomForm() {
  const [selectedType, setSelectedType] = useState('hotel')
  const [formData, setFormData] = useState<FormData>({
    name: '',
    description: '',
    image: null,
    dailyPrice: 0,
    maxPeople: 1,
    street: '',
    number: 0,
    neighbourhood: '',
    city: '',
  })
  const [amount] = useState<number>(0)

  const handleTypeChange = (type: 'hotel' | 'apartment') => {
    setSelectedType(type)
  }

  const handleAmountChange = (value: number) => {
    setFormData((prevFormData) => ({ ...prevFormData, dailyPrice: value }))
  }

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault()

    try {
      const response = await fetch('SUA_URL_DA_API', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      })

      if (response.ok) {
        console.log('Requisição bem-sucedida!')
      } else {
        console.error('Erro na requisição:', response.statusText)
      }
    } catch (error) {
      console.error('Erro na requisição:', error)
    }
  }
  const handleMaxPeopleChange = (value: number) => {
    setFormData((prevFormData) => ({ ...prevFormData, maxPeople: value }))
  }
  return (
    <AddRoom>
      <form action="" method="post" onSubmit={handleSubmit}>
        <h1>
          Comece escolhendo o tipo do seu <span>Imóvel</span>
        </h1>
        <div className="buttons">
          <button
            type="button"
            onClick={() => handleTypeChange('hotel')}
            className={selectedType === 'hotel' ? 'active' : ''}
          >
            Hotel
          </button>
          <button
            type="button"
            onClick={() => handleTypeChange('apartment')}
            className={selectedType === 'apartment' ? 'active' : ''}
          >
            Apartamento/Casa
          </button>
        </div>
        <div className="inputs">
          {selectedType === 'hotel' && (
            <>
              <label htmlFor="name">Nome do Hotel</label>
              <input type="text" name="name" id="name" />
              <label htmlFor="">Descrição</label>
              <textarea
                name="description"
                id="description"
                cols={30}
                rows={8}
              ></textarea>
              <ImageInput
                label="Selecione uma imagem:"
                onChange={(selectedImage) =>
                  console.log(`Imagem selecionada: ${selectedImage}`)
                }
              />
            </>
          )}
          {selectedType === 'apartment' && (
            <>
              <label htmlFor="name">Nome do Apartamento/Casa</label>
              <input type="text" name="name" id="name" autoComplete="none" />
              <label htmlFor="description">Descrição</label>
              <textarea
                name="description"
                id="description"
                cols={30}
                rows={8}
              ></textarea>
              <ImageInput
                label="Selecione uma imagem:"
                onChange={(selectedImage) =>
                  console.log(`Imagem selecionada: ${selectedImage}`)
                }
              />
              <div className="priceAndMaxP">
                <label htmlFor="dailyPrice">Preço da Diária</label>
                <label htmlFor="maxPeople">Dormitórios</label>
                <CurrencyInput value={amount} onChange={handleAmountChange} />
                <input
                  type="number"
                  name="maxPeople"
                  min={1}
                  value={formData.maxPeople}
                  onChange={(e) =>
                    handleMaxPeopleChange(Number(e.target.value))
                  }
                />
              </div>
              <div className="address">
                <label htmlFor="street">Rua</label>
                <label htmlFor="number">Número</label>
                <input type="text" name="street" id="street" />
                <input type="number" name="number" id="number" />
                <label htmlFor="neighborhood">Bairro</label>
                <label htmlFor="city">Cidade</label>
                <input type="text" name="neighborhood" id="neighborhood" />
                <input type="text" name="city" id="city" />
              </div>
            </>
          )}
        </div>
        <button type="submit">Envia</button>
      </form>
    </AddRoom>
  )
}
