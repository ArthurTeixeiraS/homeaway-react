import styled from 'styled-components'

export const Card = styled.div`
  display: flex;
  justify-content: space-between;
  height: 100%;
  background: ${(props) => props.theme['background-gray']};
  padding: 1rem;
  margin: 1rem;
  border-radius: 1.5rem;
  .information {
    display: flex;
  }
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
    .description {
      margin: 0.8rem 0 1.2rem 0;
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
      .classification {
        display: flex;
        justify-content: space-around;
      }
    }
  }
  .buttons {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 2rem;
    button {
      margin: 1rem 0 0 0;
      width: 100%;
      padding: 1rem 3rem;
      border: 0;
      border-radius: 1.5rem;
      background-color: ${(props) => props.theme['yellow-secondary']};
      color: white;
      font-size: 1.5rem;
      transition: all 0.2s ease-in-out;
      &:hover {
        filter: brightness(90%);
      }
    }
    .remove {
      background-color: #e8eaec;
      color: ${(props) => props.theme.black};
      /* border: 1px solid ${(props) => props.theme.black}; */
    }
  }
`
