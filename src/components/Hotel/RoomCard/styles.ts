import styled from 'styled-components'

export const Card = styled.div`
  display: flex;
  height: 100%;
  background: ${(props) => props.theme['background-gray']};
  padding: 1rem;
  margin: 1rem;
  border-radius: 1.5rem;
  img {
    width: 15rem;
    height: 100%;
    aspect-ratio: 4/4;
    border-radius: 1.5rem;
  }
  .infos {
    margin-top: 1rem;
    margin-left: 1rem;
    h3 {
      margin-bottom: 1rem;
    }
    .secondaryInfos {
      display: grid;
      grid-template-columns: 200px 200px;
      grid-row: auto auto;
      grid-column-gap: 20px;
      grid-row-gap: 20px;
      p {
        font-size: 1.2rem;
      }
    }
  }
`
