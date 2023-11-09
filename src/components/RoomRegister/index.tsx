import { AddRoom } from './styles'

/* let tipoForm: string = ''

function trocaForm(tipo: string): string {
  if (tipo === 'h') {
    return (tipoForm = 'hotel')
  } else {
    return (tipoForm = 'ap/casa')
  }
} */

export function AddRoomForm() {
  return (
    <AddRoom>
      <form action="">
        <h1>
          Comece escolhendo o tipo do seu <span>Imóvel</span>
        </h1>
        <div className="buttons">
          <button type="button">Hotel</button>
          <button type="button">Apartamento/Casa</button>
        </div>
        <div className="inputs">
          <label htmlFor="name">Nome de exibição</label>
          <input type="text" name="name" id="name" />
          <label htmlFor="description">Descrição</label>
          <input type="text" name="description" id="description" />
          <label htmlFor="dailyPirce">Valor Diária</label>
          <input type="number" name="dailyPrice" id="dailyPrice" />
        </div>
      </form>
    </AddRoom>
  )
}
