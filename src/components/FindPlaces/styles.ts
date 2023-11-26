import styled from 'styled-components'

export const FindPlacesContainer = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  .container {
    padding: 5rem;
    .titleContainer {
      font-size: 1.8rem;
      padding-bottom: 1rem;
    }
  }
  .roomsContainer {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    gap: 2rem 0;
    grid-auto-rows: auto;
  }
`
