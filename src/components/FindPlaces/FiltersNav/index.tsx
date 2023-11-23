import { FilterNav } from './styles'
import filterIcon from '../../../assets/filterIcon.png'

export function FiltersNav() {
  return (
    <FilterNav>
      <ul>
        <li>
          <a>Quartos</a>
        </li>
        <li>
          <a>Casas</a>
        </li>
        <li>
          <a>Hoteis</a>
        </li>
      </ul>

      <div className="filterButton">
        <button>
          <img src={filterIcon} width={17} alt="" />
          Filtrar
        </button>
      </div>
    </FilterNav>
  )
}
