import { useState } from 'react'
import CurrencyInput from '../../../Room/RoomEdit/PriceComponent'
import { ModalContainer } from './style'
import { FaWindowClose } from 'react-icons/fa'

interface Modal {
  isOpen: boolean
  setOpen: (isOpen: boolean) => void
}

function verificaData() {
  const hoje = new Date().toISOString().slice(0, 10)
  return hoje
}

export function FilterModal({ isOpen, setOpen }: Modal) {
  const [MaxCurrencyValue, setMaxCurrencyValue] = useState<number>(0)
  const [MinCurrencyValue, setMinCurrencyValue] = useState<number>(0)

  const [selectedCheckInDate, setSelectedCheckInDate] = useState<string>(
    verificaData(),
  )

  const handleMaxCurrencyChange = (value: number) => {
    setMaxCurrencyValue(value)
  }

  const handleCheckInDateChange = (
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    setSelectedCheckInDate(event.target.value)
  }

  if (isOpen) {
    return (
      <ModalContainer>
        <div className="modal">
          <div className="title">
            <h1>Selecione Filtros</h1>
            <button onClick={() => setOpen(!isOpen)}>
              <FaWindowClose id="close-icon" size={18} />
            </button>
          </div>
          <p>Para achar o quarto ideal para você</p>
          <div className="filters">
            <div className="priceRange">
              <label htmlFor="minPrice">
                <h2>Mín:</h2>
              </label>
              <CurrencyInput
                value={MinCurrencyValue}
                onChange={setMinCurrencyValue}
              />
              <label className="separador" htmlFor="maxPrice">
                <h2>Max:</h2>
              </label>
              <CurrencyInput
                value={MaxCurrencyValue}
                onChange={handleMaxCurrencyChange}
              />
            </div>
            <div className="checkin-out">
              <div className="checkin">
                <label htmlFor="">
                  <h2>Entrada:</h2>
                </label>
                <input
                  type="date"
                  name=""
                  id=""
                  min={verificaData()}
                  value={selectedCheckInDate}
                  onChange={handleCheckInDateChange}
                />
              </div>
              <div className="checkout">
                <label htmlFor="">
                  <h2>Saída:</h2>
                </label>
                <input type="date" name="" id="" min={selectedCheckInDate} />
              </div>
            </div>
            <div className="checkboxes">
              <div className="checkContainer">
                <label htmlFor="hasRoomService">
                  <h2>Serviço de quarto</h2>
                </label>
                <input type="checkbox" name="" id="hasRoomService" />
              </div>
              <div className="checkContainer">
                <label htmlFor="allowPets">
                  <h2>Permite animais de estimação</h2>
                </label>
                <input type="checkbox" name="" id="allowPets" />
              </div>
              <div className="checkContainer">
                <label htmlFor="hasWifi">
                  <h2>Possui acesso a Wifi</h2>
                </label>
                <input type="checkbox" name="" id="hasWifi" />
              </div>
            </div>
          </div>
          <div className="button">
            <button type="submit">Aplicar filtros</button>
          </div>
        </div>
      </ModalContainer>
    )
  } else {
    return <></>
  }
}
