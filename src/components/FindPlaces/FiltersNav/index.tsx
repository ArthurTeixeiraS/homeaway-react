import { FilterNav } from './styles'
import filterIcon from '../../../assets/filterIcon.png'

export function FiltersNav() {
  return (
    <FilterNav>
      <li>
        <button>Quartos</button>
      </li>
      <li>
        <button>Casas</button>
      </li>
      <li>
        <button>Hoteis</button>
      </li>

      <div className="filterButton">
        <button>
          <img src={filterIcon} width={17} alt="" />
          Filtrar
        </button>
      </div>
    </FilterNav>
  )
}
